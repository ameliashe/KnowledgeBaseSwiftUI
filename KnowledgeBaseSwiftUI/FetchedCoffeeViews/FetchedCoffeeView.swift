//
//  FetchedCoffeeView.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI
import SwiftData

struct FetchedCoffeeView: View {
	@State private var showingErrorAlert = false
	@State private var errorAlertMessage = ""
	@State private var coffees: [Coffee] = []
	@Environment(\.modelContext) private var context
	var titleOn: Bool
	var rowHeight: Double



	var body: some View {

		NavigationView() {
			List(coffees) { coffee in
				NavigationLink {
					CoffeeDetails(coffee: coffee)
				} label: {
					CoffeeRow(coffee: coffee, rowHeight: rowHeight)
				}
			}
			.navigationTitle(titleOn ? "Hot Coffee" : "")
			.navigationBarTitleDisplayMode(.large)
			.listStyle(.plain)
		}
		.alert("Error", isPresented: $showingErrorAlert) {
			Button("OK", role: .cancel) {}
		} message: {
			Text(errorAlertMessage)
		}
		.task {
			let fetchDescriptor = FetchDescriptor<Coffee>(sortBy: [])
			coffees = (try? context.fetch(fetchDescriptor)) ?? []

			loadCoffees()
		}
	}

	func loadCoffees() {
		let url = URL(string: "https://api.sampleapis.com/coffee/hot")!
		NetworkService.request(from: url) { result in
			DispatchQueue.global().async {
				switch result {
				case .success(let data):
					if let fetched = Parser.decode(data) {
						let fetchDescriptor = FetchDescriptor<Coffee>(sortBy: [])
						if let cache = try? context.fetch(fetchDescriptor) {
							cache.forEach { context.delete($0) }
						}

						for i in fetched {
							let model = Coffee(fetched: i)
							context.insert(model)
						}
						try? context.save()
						coffees = (try? context.fetch(fetchDescriptor)) ?? []

					} else {
						errorAlertMessage = "Data error"
						showingErrorAlert = true
					}
				case .failure(let error):
					print(error, error.localizedDescription)
					errorAlertMessage = "Error: \(error.localizedDescription)"
					showingErrorAlert = true
				}
			}
		}
	}
}

#Preview {
//    FetchedCoffeeView()
}

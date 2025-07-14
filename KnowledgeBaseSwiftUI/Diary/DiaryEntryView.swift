//
//  DiaryEntryView.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 5/3/25.
//

import SwiftUI
import SwiftData

struct DiaryEntryView: View {
	let drinks = posts.map( { $0.title })
	@State private var selectedDate: Date = Date()
	@State private var selectedDrink: String?
	@Environment(\.modelContext) private var modelContext
	@Environment(\.dismiss) private var dismiss


	var body: some View {
		VStack {
			Form {
				DatePicker("Когда?", selection: $selectedDate, displayedComponents: .date)
					.datePickerStyle(.compact)

				HStack {
					Text("Что?")
					Spacer()
					Menu {
						ForEach(drinks, id: \.self) { drink in
							Button(action: {
								self.selectedDrink = drink
							}, label: {
								Text(drink)
							})
						}
					} label: {
						Text(selectedDrink == nil ? "Выберите напиток" : selectedDrink!)

					}
				}
			}
			Button {
				guard let drink = selectedDrink else { return }
				let entry = DiaryEntry(date: selectedDate, drinks: [drink])
				modelContext.insert(entry)
				try? modelContext.save()
				dismiss()
			} label: {
				Text("Добавить")
			}
		}
	}
}

#Preview {
	DiaryEntryView()
}

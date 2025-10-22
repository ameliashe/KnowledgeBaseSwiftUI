//
//  DiaryEntryView.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 5/3/25.
//

import SwiftUI
import SwiftData

struct DiaryEntryView: View {
	@State private var drinks: [String] = []
	@State private var selectedDate: Date = Date()
	@State private var selectedDrink: String?
	@Environment(\.modelContext) private var modelContext
	@Environment(\.dismiss) private var dismiss


	var body: some View {
		VStack {
			Form {
				DatePicker("When?", selection: $selectedDate, displayedComponents: .date)
					.datePickerStyle(.compact)

				HStack {
					Text("What?")
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
						Text(selectedDrink == nil ? "Choose a drink" : selectedDrink!)

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
				Text("Add")
			}
		}
		.task {
			let items = await DrinksLoader.loadDrinks()
			self.drinks = items.map { $0.title }
			if self.selectedDrink == nil, let first = self.drinks.first {
				self.selectedDrink = first
			}
		}
	}
}

//
//  SettingsView.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct SettingsView: View {
	@Environment(\.colorScheme) var colorScheme
	@Binding var titleOn: Bool
	@Binding var rowHeight: Double
	@State var isChanging: Bool = false
	@State private var drinks: [Drink] = []
	
	var body: some View {
		NavigationStack {
			Form {
				Section {
					Text(colorScheme == .light ? "Light Theme Enabled" : "Dark Theme Enabled")
					Toggle("Navigation Titles", isOn: $titleOn)
				}
				Section {
					Text("Row Height: \(Int(rowHeight))")
						.contentTransition(.numericText())
					Slider(value: $rowHeight, in: 40...120, step: 1, onEditingChanged: { editing in
						isChanging = editing
					})
					if isChanging {
						DrinkCell(rowHeight: rowHeight, drink: drinks.first!)
							.frame(height: CGFloat(rowHeight))
					}
				}
			}
			.navigationTitle(titleOn ? "Settings" : "")
			.navigationBarTitleDisplayMode(.large)
		}
		.task {
			drinks = await DrinksLoader.loadDrinks()
		}
	}
}

#Preview {
	SettingsView(titleOn: .constant(true), rowHeight: .constant(100))
}

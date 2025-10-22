//
//  DrinksView.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct DrinksView: View {
	@State private var drinks: [Drink] = []
	var titleOn: Bool
	var rowHeight: Double

    var body: some View {
		
		NavigationView() {
			List(drinks) { drink in
				NavigationLink {
					DrinkDetails(drink: drink)
				} label: {
					DrinkCell(rowHeight: rowHeight, drink: drink)
						.frame(height: CGFloat(rowHeight))
				}
			}
			.navigationTitle(titleOn ? "Favorite Drinks" : "")
			.navigationBarTitleDisplayMode(.large)
			.listStyle(.plain)
		}
		.task {
			drinks = await DrinksLoader.loadDrinks()
		}
    }
}

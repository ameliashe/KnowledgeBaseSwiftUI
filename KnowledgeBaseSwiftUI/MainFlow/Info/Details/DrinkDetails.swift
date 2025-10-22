//
//  DrinkDetails.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct DrinkDetails: View {
	var drink: Drink

	var body: some View {
		ScrollView {
			Image(drink.imageName)
				.resizable()
				.scaledToFill()
			Text(drink.title)
				.font(.largeTitle)
				.fontWeight(.semibold)
			HStack {
				VStack {
					Image(systemName: "cup.and.saucer")
						.font(.title2)
					Text("\(drink.portionML)" + " ml")
						.font(.title2)
						.padding(.horizontal)
				}
				Divider()
				VStack {
					Image(systemName: "timer")
						.font(.title2)
					Text("\(drink.minutes)")
						.font(.title2)
						.padding(.horizontal)
				}
				Divider()
				NavigationLink(destination: StepsView(steps: drink.steps)) {
					Text("Recipe")
						.font(.title2)
						.fontWeight(.bold)
						.padding()
						.frame(maxWidth: .infinity)
						.background(
							LinearGradient(
								gradient: Gradient(colors: [Color.orange, Color.yellow]),
								startPoint: .topLeading,
								endPoint: .bottomTrailing
							)
						)
						.foregroundColor(.white)
						.cornerRadius(8)
						.shadow(color: .orange, radius: 4)
						.padding()
				}
			}
			VStack {
				Text("Coffee: " + "\(drink.coffeeType.localizedString)")
				Text("Additional ingredients: " + "\(drink.ingredients.joined(separator: ", "))")
			}
			.font(.callout)
			.opacity(0.6)

			Divider()
			Text(drink.description)
				.font(.body)
				.padding(.horizontal)

		}
	}
}

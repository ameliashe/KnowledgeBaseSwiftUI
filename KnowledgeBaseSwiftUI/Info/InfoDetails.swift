//
//  InfoDetails.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct InfoDetails: View {
	var post: Post

	var body: some View {
		ScrollView {
			post.image
				.resizable()
				.scaledToFill()
			Text(post.title)
				.font(.largeTitle)
				.fontWeight(.semibold)
			HStack {
				VStack {
					Image(systemName: "cup.and.saucer")
						.font(.title2)
					Text(post.portionSize  + " мл")
						.font(.title2)
						.padding(.horizontal)
				}
				Divider()
				VStack {
					Image(systemName: "timer")
						.font(.title2)
					Text(post.cookingTime)
						.font(.title2)
						.padding(.horizontal)
				}
				Divider()
				NavigationLink(destination: StepsView(steps: post.steps)) {
					Text("Рецепт")
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
				Text("**Кофе**:  \(post.coffeeType)")
				Text("**Дополнительные инградиенты**:  \(post.ingredients.joined(separator: ", "))")
			}
			.font(.callout)
			.opacity(0.6)

			Divider()
			Text(post.description)
				.font(.body)
				.padding(.horizontal)

		}
	}
}

#Preview {
	InfoDetails(post: posts[1])
}

//
//  CoffeeDetails.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct CoffeeDetails: View {
	var coffee: Coffee

	var body: some View {
		ScrollView {
			AsyncImage(url: URL(string: coffee.image)) { result in
				if let image = result.image {
					image
						.resizable()
						.scaledToFill()
				} else {
					Image(systemName: "photo.artframe")
						.resizable()
						.scaledToFill()
						.redacted(reason: .placeholder)
				}
			}
			Text(coffee.title)
				.font(.largeTitle)
				.fontWeight(.semibold)
				.padding()
			Text(coffee.text)
				.font(.body)
				.padding(.horizontal)
		}
    }
}

#Preview {
//	CoffeeDetails(post: posts[1])
}

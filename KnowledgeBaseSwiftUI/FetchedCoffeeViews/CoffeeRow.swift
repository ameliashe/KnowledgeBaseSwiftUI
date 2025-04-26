//
//  CoffeeRow.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct CoffeeRow: View {

	var coffee: Coffee

	var body: some View {
		HStack {
			AsyncImage(url: URL(string: coffee.image)!) { result in
				if let image = result.image {
					image
						.resizable()
						.scaledToFill()
						.clipShape(Circle())
						.frame(width: 70, height: 70)
						.padding(.leading, 10)
				} else {
					Image(systemName: "photo.artframe")
						.resizable()
						.scaledToFill()
						.clipShape(Circle())
						.frame(width: 70, height: 70)
						.padding(.leading, 10)
						.redacted(reason: .placeholder)
				}
			}
			Text(coffee.title)
			Spacer()
		}
	}
}


#Preview {
//	CoffeeRow(coffee: coffee.first!)
}

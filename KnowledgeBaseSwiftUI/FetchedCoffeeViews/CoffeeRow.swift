//
//  CoffeeRow.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct CoffeeRow: View {

	var coffee: Coffee
	var rowHeight: Double
	var padding: Double = 10.0

	var body: some View {
		HStack {
			AsyncImage(url: URL(string: coffee.image)!) { result in
				if let image = result.image {
					image
						.resizable()
						.scaledToFill()
						.clipShape(Circle())
						.frame(width: CGFloat(rowHeight - padding), height: CGFloat(rowHeight - padding))
						.padding(.leading, 8)
				} else {
					Image(systemName: "photo.artframe")
						.resizable()
						.scaledToFill()
						.clipShape(Circle())
						.frame(width: CGFloat(rowHeight - padding), height: CGFloat(rowHeight - padding))
						.padding(.leading, 8)
						.redacted(reason: .placeholder)
				}
			}
			Text(coffee.title)
				.font(.system(size: rowHeight/3, weight: .regular, design: .default))
			Spacer()
		}
	}
}


#Preview {
//	CoffeeRow(coffee: coffee.first!)
}

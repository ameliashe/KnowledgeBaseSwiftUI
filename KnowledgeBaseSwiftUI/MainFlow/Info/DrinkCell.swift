//
//  DrinkCell.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct DrinkCell: View {
	var rowHeight: Double
	var padding: Double = 10.0
	var drink: Drink

    var body: some View {
		HStack {
			Image(drink.imageName)				.resizable()
				.scaledToFill()
				.clipShape(Circle())
				.frame(width: CGFloat(rowHeight - padding), height: CGFloat(rowHeight - padding))
				.padding(.leading, 8)
			Text(drink.title)
				.font(.system(size: rowHeight/3, weight: .regular, design: .default))
			Spacer()
		}
    }
}

#Preview {
//	InfoRow(post: posts.first!)
}

//
//  InfoRow.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct InfoRow: View {
	var rowHeight: Double
	var padding: Double = 10.0

	var post: Post

    var body: some View {
		HStack {
			post.image
				.resizable()
				.scaledToFill()
				.clipShape(Circle())
				.frame(width: CGFloat(rowHeight - padding), height: CGFloat(rowHeight - padding))
				.padding(.leading, 8)
			Text(post.title)
				.font(.system(size: rowHeight/3, weight: .regular, design: .default))
			Spacer()
		}
    }
}

#Preview {
//	InfoRow(post: posts.first!)
}

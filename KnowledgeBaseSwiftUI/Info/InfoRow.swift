//
//  InfoRow.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct InfoRow: View {

	var post: Post

    var body: some View {
		HStack {
			post.image
				.resizable()
				.scaledToFill()
				.clipShape(Circle())
				.frame(width: 70, height: 70)
				.padding(.leading, 10)
			Text(post.title)
			Spacer()
		}
    }
}

#Preview {
	InfoRow(post: posts.first!)
}

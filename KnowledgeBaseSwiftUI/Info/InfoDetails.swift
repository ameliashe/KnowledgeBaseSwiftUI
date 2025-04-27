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
				.padding()
			Text(post.description)
				.font(.body)
				.padding(.horizontal)
		}
    }
}

#Preview {
	InfoDetails(post: posts[1])
}

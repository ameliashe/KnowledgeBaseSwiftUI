//
//  InfoView.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct InfoView: View {
	var titleOn: Bool
	var rowHeight: Double

    var body: some View {
		
		NavigationView() {
			List(posts) { post in
				NavigationLink {
					InfoDetails(post: post)
				} label: {
					InfoRow(rowHeight: rowHeight, post: post)
						.frame(height: CGFloat(rowHeight))
				}
			}
			.navigationTitle(titleOn ? "Favorite Coffee Drinks" : "")
			.navigationBarTitleDisplayMode(.large)
			.listStyle(.plain)
		}
		.task {
			print()
		}
    }
}

#Preview {
//    InfoView(titleOn: true)
}

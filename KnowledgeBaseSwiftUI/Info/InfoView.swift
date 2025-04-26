//
//  InfoView.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
		
		NavigationView() {
			List(posts) { post in
				NavigationLink {
					InfoDetails(post: post)
				} label: {
					InfoRow(post: post)
				}
			}
			.navigationTitle("Кофейные напитки")
			.listStyle(.plain)
		}
    }
}

#Preview {
    InfoView()
}

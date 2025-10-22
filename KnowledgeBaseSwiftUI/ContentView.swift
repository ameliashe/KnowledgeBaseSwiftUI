//
//  ContentView.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct ContentView: View {
	@AppStorage("titleOn") private var titleOn: Bool = true
	@AppStorage("rowHeight") private var rowHeight: Double = 80

	var body: some View {
		TabView {
			FetchedCoffeeView(titleOn: titleOn, rowHeight: rowHeight)
				.tabItem {
					Label("Coffee List", systemImage: "cup.and.saucer.fill")
				}
			DrinksView(titleOn: titleOn, rowHeight: rowHeight)
				.tabItem {
					Label("Favorites", systemImage: "heart.fill")
				}
			DiaryView(titleOn: titleOn)
				.tabItem {
					Label("Diary", systemImage: "calendar")
				}

			SettingsView(titleOn: $titleOn, rowHeight: $rowHeight)
				.tabItem {
					Label("Settings", systemImage: "gear")
				}
		}
    }
}

#Preview {
	ContentView()
}

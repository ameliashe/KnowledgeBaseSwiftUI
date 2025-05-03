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
					Label("Hot Coffee", systemImage: "cup.and.saucer.fill")
				}
			InfoView(titleOn: titleOn, rowHeight: rowHeight)
				.tabItem {
					Label("Избранное", systemImage: "heart.fill")
				}
			DiaryView()
				.tabItem {
					Label("Дневник", systemImage: "calendar")
				}

			SettingsView(titleOn: $titleOn, rowHeight: $rowHeight)
				.tabItem {
					Label("Настройки", systemImage: "gear")
				}
		}
    }
}

#Preview {
	ContentView()
}

//
//  ContentView.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct ContentView: View {

	var body: some View {
		TabView {
			FetchedCoffeeView()
				.tabItem {
					Label("Hot Coffee", systemImage: "cup.and.saucer.fill")
				}
			InfoView()
				.tabItem {
					Label("Info", systemImage: "list.bullet.rectangle.portrait")
				}
			HelloView()
				.tabItem {
					Label("Hello", systemImage: "person.circle")
				}

			SettingsView()
				.tabItem {
					Label("Настройки", systemImage: "gear")
				}
		}
    }
}

#Preview {
    ContentView()
}

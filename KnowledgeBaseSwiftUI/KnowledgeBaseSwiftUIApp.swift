//
//  KnowledgeBaseSwiftUIApp.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI
import SwiftData

@main
struct KnowledgeBaseSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		.modelContainer(for: [Coffee.self])
    }
}

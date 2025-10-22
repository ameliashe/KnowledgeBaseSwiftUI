//
//  LocalDataLoader.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Shekikhacheva on 10/21/25.
//

import Foundation

enum DrinksLoader {
	private static var cache: [Drink]?

	static func loadDrinks(locale: Locale = .current, bundle: Bundle = .main) async -> [Drink] {
		if let cache { return cache }

		let languageCode = locale.language.languageCode?.identifier ?? "en"
		let candidateFilenames = ["drinks.\(languageCode)", "drinks.en"]

		print("Bundle path: \(bundle.bundlePath)")
		print("Trying to load drinks from: \(candidateFilenames)")

		for name in candidateFilenames {
			if let url = bundle.url(forResource: name, withExtension: "json") {
				do {
					let data = try Data(contentsOf: url)
					let drinks = try JSONDecoder().decode([Drink].self, from: data)
					self.cache = drinks
					print("Loaded \(drinks.count) drinks from \(url.lastPathComponent)")
					return drinks
				} catch {
					print("Found \(url.lastPathComponent) but failed to decode: \(error)")
				}
			} else {
				print("Not found: \(name).json")
			}
		}

		assertionFailure("Drinks JSON not found or failed to decode")
		return []
	}

	static func invalidateCache() {
		self.cache = nil
	}
}

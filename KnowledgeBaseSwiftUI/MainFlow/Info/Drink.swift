//
//  Drink.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import Foundation
import SwiftUI

struct Drink: Identifiable, Codable, Hashable {
	let id: Int
	let title: String
	let description: String
	let imageName: String
	let coffeeType: CoffeeType
	let ingredients: [String]
	let steps: [String]
	let minutes: Int
	let portionML: Int
}

enum CoffeeType: String, Codable, Hashable {
	case ground
	case instant

	var localizationKey: String {
		switch self {
		case .ground:  return "coffeeType.ground"
		case .instant: return "coffeeType.instant"
		}
	}
	
	var localizedString: String {
		NSLocalizedString(localizationKey, comment: "")
	}
}

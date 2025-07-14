//
//  Model.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import Foundation
import SwiftUI
import UIKit
import SwiftData

struct FetchedCoffee: Codable, Identifiable {
	let id: Int
	let title: String
	let price: Double
	let description: String
	let image: String
	let ingredients: [String]
	let totalSales: Int
}


@Model
class Coffee {
	@Attribute(.unique) var id: Int
	var title: String
	var price: Double
	var text: String
	var image: String
	var ingredients: [String]
	var totalSales: Int

	init(id: Int, title: String, price: Double, text: String, image: String, ingredients: [String], totalSales: Int) {
		self.id = id
		self.title = title
		self.price = price
		self.text = text
		self.image = image
		self.ingredients = ingredients
		self.totalSales = totalSales
	}

	convenience init(fetched: FetchedCoffee) {
		self.init(id: fetched.id, title: fetched.title, price: fetched.price, text: fetched.description, image: fetched.image, ingredients: fetched.ingredients, totalSales: fetched.totalSales)
	}
}

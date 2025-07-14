//
//  DiaryModel.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 5/3/25.
//

import Foundation
import SwiftData

@Model
class DiaryEntry {
	var date: Date
	var drinks: [String]

	init(date: Date, drinks: [String]) {
		self.date = date
		self.drinks = drinks
	}
}

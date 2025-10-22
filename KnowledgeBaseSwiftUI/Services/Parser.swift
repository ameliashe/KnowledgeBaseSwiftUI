//
//  Parser.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import Foundation

final class Parser {
	static func decode(_ data: Data) -> [FetchedCoffee]? {
		do {
			let answer = try JSONDecoder().decode([FetchedCoffee].self, from: data)
			return answer
		} catch {
			print(error.localizedDescription)
		}
		return nil
	}
}

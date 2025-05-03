//
//  DiaryEntryDetails.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 5/3/25.
//

import SwiftUI

struct DiaryEntryDetails: View {
	@State var date: Date
	@State var drinks: [String]

	var body: some View {
		List {
			ForEach(drinks, id: \.self) { drink in
				Text(drink)
			}
		}
		.navigationTitle(Text(date, format: .dateTime.year().month().day()))
		.navigationBarTitleDisplayMode(.inline)
	}
}

#Preview {
//    DiaryEntryDetails()
}

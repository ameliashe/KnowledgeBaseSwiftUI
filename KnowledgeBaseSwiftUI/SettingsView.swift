//
//  SettingsView.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct SettingsView: View {
	@Environment(\.colorScheme) var colorScheme
	@Binding var titleOn: Bool
	@Binding var rowHeight: Double
	@State var isChanging: Bool = false

    var body: some View {
        Form {
			Section {
				Text("Settings")
				Text(colorScheme == .light ? "Light Theme Enabled" : "Dark Theme Enabled")
				Toggle("Title", isOn: $titleOn)
				Text(titleOn ? "Navigation Title Enabled" : "Navigation Title Disabled")
			}
			Section {
				Text("Row Height: \(Int(rowHeight))")
					.contentTransition(.numericText())
				Slider(value: $rowHeight, in: 40...120, step: 1, onEditingChanged: { editing in
					isChanging = editing
				})
				if isChanging {
					InfoRow(rowHeight: rowHeight, post: posts.first!)
						.frame(height: CGFloat(rowHeight))
				}
			}
		}
    }
}

#Preview {
//	SettingsView()
}

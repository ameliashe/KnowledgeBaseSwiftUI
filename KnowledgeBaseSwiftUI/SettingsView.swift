//
//  SettingsView.swift
//  KnowledgeBaseSwiftUI
//
//  Created by Amelia Romanova on 4/23/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
			Section {
				Text("Settings")
				Toggle("Toggle", isOn: .constant(false))
				Picker("Language", selection: .constant(0)) {
					Text("English").tag(0)
					Text("Russian").tag(1)
				}
			}
			Section {
				Slider(value: .constant(0), in: 0...100)
				Text("Slider")
			}
		}
    }
}

#Preview {
    SettingsView()
}

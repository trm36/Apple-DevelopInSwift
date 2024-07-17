//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Taylor on 7/17/24.
//

import SwiftUI

struct ThemePicker: View {

    /// The currently selected `Theme`.
    @Binding var selectedTheme: Theme

    var body: some View {
        Picker("Theme", selection: $selectedTheme) {
            ForEach(Theme.allCases) {
                ThemeView(theme: $0)
                    .tag($0)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    ThemePicker(selectedTheme: .constant(.periwinkle))
}

//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Taylor on 7/17/24.
//

import SwiftUI

struct ThemeView: View {
    /// The `Theme` displayed on this view.
    let theme: Theme

    var body: some View {
        Text(theme.name)
            .padding(8.0)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundStyle(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 8.0))
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}

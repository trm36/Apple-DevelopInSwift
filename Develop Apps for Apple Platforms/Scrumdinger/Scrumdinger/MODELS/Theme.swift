//
//  Theme.swift
//  Scrumdinger
//
//  Created by Taylor on 7/16/24.
//

import Foundation
import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow

    /// The theme's accent color which provides a high-contrast complement
    /// to the theme’s main color, `mainColor`, ensuring your views remain accessible.
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow:
            return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: 
            return .white
        }
    }

    /// The theme's main color.
    var mainColor: Color {
        return Color(rawValue)
    }

    /// The display name of the Theme.
    var name: String {
        return rawValue.capitalized
    }

    /// The `Theme`'s raw value, An id property to conform to Identifiable.
    var id: String {
        return self.rawValue
    }
}

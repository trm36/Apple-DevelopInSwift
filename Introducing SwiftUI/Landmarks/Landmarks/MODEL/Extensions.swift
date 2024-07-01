//
//  Extensions.swift
//  Landmarks
//
//  Created by Taylor on 7/1/24.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        return .asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity),
                           removal: .scale.combined(with: .opacity))
    }
}

extension Animation {
    static func ripple(index: Int) -> Animation {
        return .spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

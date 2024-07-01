//
//  Badge.swift
//  Landmarks
//
//  Created by Taylor on 6/30/24.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            let angle = Angle(degrees: Double(index) / 8.0 * 360.0)
            RotatedBadgeSymbol(angle: angle)
                .opacity(0.5)
        }
        
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.25 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (2.75 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

#Preview {
    Badge()
}

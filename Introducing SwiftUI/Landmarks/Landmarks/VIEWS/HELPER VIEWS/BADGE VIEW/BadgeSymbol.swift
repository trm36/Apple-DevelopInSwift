//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by Taylor on 6/30/24.
//

import SwiftUI

struct BadgeSymbol: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let smallestDimension: CGFloat = min(geometry.size.width, geometry.size.height)
                let width = smallestDimension
                let height = smallestDimension * 0.75
                let spacing = smallestDimension * 0.030
                let middle = smallestDimension * 0.5
                let topWidth = smallestDimension * 0.226
                let topHeight = height * 0.488
                
                // SNOW CAPPED
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: (topHeight / 2.0) + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing),
                ])
                
                // VEGETATION ALONG THE APPROACH
                path.move(to: CGPoint(x: middle, y: (topHeight / 2.0) + (3.0 * spacing)))
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: (topHeight / 2.0) + (3.0 * spacing)),
                ])
            }
            .fill(.symbol)
        }
    }
}

#Preview {
    BadgeSymbol()
}

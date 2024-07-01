//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Taylor on 6/30/24.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let smallestDimension: CGFloat = min(geometry.size.width, geometry.size.height)
                var width = smallestDimension
                let height = smallestDimension
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                let pointA = CGPoint(x: width * 0.95 + xOffset, y: height * (0.20 + HexagonParameters.adjustment))
                path.move(to: pointA)
                
                HexagonParameters.segments.forEach { segment in
                    let pointB = CGPoint(x: width * segment.line.x + xOffset, y: height * segment.line.y)
                    path.addLine(to: pointB)

                    let pointC = CGPoint(x: width * segment.curve.x + xOffset, y: height * segment.curve.y)
                    let pointD = CGPoint(x: width * segment.control.x + xOffset, y: height * segment.control.y)
                    path.addQuadCurve(to: pointC, control: pointD)
                }
            }
            .fill(.linearGradient(
                Gradient(colors: [.gradientStart, .gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        .aspectRatio(1.0, contentMode: .fit)
    }
}

#Preview {
    BadgeBackground()
}

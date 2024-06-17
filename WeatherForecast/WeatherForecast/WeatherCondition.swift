//
//  WeatherCondition.swift
//  WeatherForecast
//
//  Created by Taylor on 6/17/24.
//

import Foundation
import SwiftUI

struct WeatherCondition {
    let iconName: String
    let color: Color
    var image: some View {
        Image(systemName: iconName)
            .foregroundStyle(color)
    }
    
    static let sunny = WeatherCondition(iconName: "sun.max.fill", color: .yellow)
    static let rainy = WeatherCondition(iconName: "cloud.rain.fill", color: .blue)
    static let drizzle = WeatherCondition(iconName: "cloud.drizzle.fill", color: .teal)
    static let cloudy = WeatherCondition(iconName: "cloud.fill", color: .gray)
    static let partlyCloudy = WeatherCondition(iconName: "cloud.sun.fill", color: .orange)
}

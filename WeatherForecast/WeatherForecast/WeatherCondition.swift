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
    let isRain: Bool
    let isSun: Bool
    var image: some View {
        Image(systemName: iconName)
            .foregroundStyle(color)
    }
    
    static let sunny = WeatherCondition(iconName: "sun.max.fill", color: .yellow, isRain: false, isSun: true)
    static let rainy = WeatherCondition(iconName: "cloud.rain.fill", color: .blue, isRain: true, isSun: false)
    static let drizzle = WeatherCondition(iconName: "cloud.drizzle.fill", color: .teal, isRain: true, isSun: false)
    static let cloudy = WeatherCondition(iconName: "cloud.fill", color: .gray, isRain: false, isSun: false)
    static let partlyCloudy = WeatherCondition(iconName: "cloud.sun.fill", color: .orange, isRain: false, isSun: false)
}

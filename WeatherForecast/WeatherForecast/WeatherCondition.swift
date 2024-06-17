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
}

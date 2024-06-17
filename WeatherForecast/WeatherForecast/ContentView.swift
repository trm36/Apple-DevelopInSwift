//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Taylor on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 8.0) {
            HStack(spacing: 8.0) {
                DayForecast(day: "MON", high: 11, low: 7, weatherCondition: .rainy)
                DayForecast(day: "TUE", high: 12, low: 6, weatherCondition: .drizzle)
                DayForecast(day: "WED", high: 13, low: 1, weatherCondition: .cloudy)
            }
            HStack(spacing: 8.0) {
                DayForecast(day: "THU", high: 17, low: 2, weatherCondition: .partlyCloudy)
                DayForecast(day: "FRI", high: 20, low: 7, weatherCondition: .sunny)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let high: Int
    let low: Int
    let weatherCondition: WeatherCondition
    
    var body: some View {
        VStack(spacing: 8.0) {
            Text(day)
                .font(.headline)
            weatherCondition.image
                .font(.largeTitle)
                .padding(5.0)
            Text("H: \(high)°C")
                .fontWeight(.medium)
            Text("L: \(low)°C")
                .fontWeight(.regular)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}

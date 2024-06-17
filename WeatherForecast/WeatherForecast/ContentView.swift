//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Taylor on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(spacing: 8.0) {
            DayForecast(day: "MON", high: 25, low: 17, weatherCondition: .sunny)
            DayForecast(day: "TUE", high: 18, low: 12, weatherCondition: .rainy)
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

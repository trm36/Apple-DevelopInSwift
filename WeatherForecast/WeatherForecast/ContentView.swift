//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Taylor on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let mon = DayWeatherData(day: "MON", high: 11, low: 7, weatherCondition: .rainy)
        let tue = DayWeatherData(day: "TUE", high: 12, low: 6, weatherCondition: .drizzle)
        let wed = DayWeatherData(day: "WED", high: 13, low: 1, weatherCondition: .cloudy)
        let thu = DayWeatherData(day: "THU", high: 17, low: 2, weatherCondition: .partlyCloudy)
        let fri = DayWeatherData(day: "FRI", high: 20, low: 7, weatherCondition: .sunny)
        
        VStack(spacing: 8.0) {
            HStack(spacing: 8.0) {
                DayForecast(dayWeatherData: mon)
                DayForecast(dayWeatherData: tue)
                DayForecast(dayWeatherData: wed)
            }
            
            HStack(spacing: 8.0) {
                DayForecast(dayWeatherData: thu)
                DayForecast(dayWeatherData: fri)
            }
            
            WeekForecast(dayWeatherDatas: [mon, tue, wed, thu, fri])
        }
    }
}

#Preview {
    ContentView()
}

struct WeekForecast: View {
    let dayWeatherDatas: [DayWeatherData]
    private let numberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 1
        return nf
    }()
    var firstDay: String {
        return dayWeatherDatas.first?.day ?? ""
    }
    var lastDay: String {
        return dayWeatherDatas.last?.day ?? ""
    }
    var averageHigh: Double {
        guard !dayWeatherDatas.isEmpty else { return 0.0 }
        let sum = dayWeatherDatas.reduce(0, { $0 + $1.high })
        return Double(sum) / Double(dayWeatherDatas.count)
    }
    var averageLow: Double {
        guard !dayWeatherDatas.isEmpty else { return 0.0 }
        let sum = dayWeatherDatas.reduce(0, { $0 + $1.low })
        return Double(sum) / Double(dayWeatherDatas.count)
    }
    var sunCount: Int {
        guard !dayWeatherDatas.isEmpty else { return 0 }
        return dayWeatherDatas.reduce(0) {
            if $1.weatherCondition.isSun {
                return $0 + 1
            } else {
                return $0
            }
        }
    }
    var rainCount: Int {
        guard !dayWeatherDatas.isEmpty else { return 0 }
        return dayWeatherDatas.reduce(0) {
            if $1.weatherCondition.isRain {
                return $0 + 1
            } else {
                return $0
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 8.0) {
            Text("Five Day Summary")
                .font(.title)
            Text("\(firstDay) - \(lastDay)")
                .font(.headline)
            let formattedAverageHigh = numberFormatter.string(from: averageHigh as NSNumber) ?? ""
            let formattedAverageLow = numberFormatter.string(from: averageLow as NSNumber) ?? ""
            Text("Avg. H: \(formattedAverageHigh)°C")
            Text("Avg. L: \(formattedAverageLow)°C")
            HStack(spacing: 8.0) {
                Image(systemName: "sun.max.fill")
                    .foregroundStyle(.yellow)
                Text("\(sunCount)")
                Image(systemName: "cloud.rain.fill")
                    .foregroundStyle(.blue)
                Text("\(rainCount)")
            }
        }
    }
}

struct DayForecast: View {
    let dayWeatherData: DayWeatherData
    
    var body: some View {
        VStack(spacing: 8.0) {
            Text(dayWeatherData.day)
                .font(.headline)
            dayWeatherData.weatherCondition.image
                .font(.largeTitle)
                .padding(5.0)
            Text("H: \(dayWeatherData.high)°C")
                .fontWeight(.medium)
            Text("L: \(dayWeatherData.low)°C")
                .fontWeight(.regular)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}

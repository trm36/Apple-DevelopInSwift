//
//  Hike.swift
//  Landmarks
//
//  Created by Taylor on 6/30/24.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
    
    /// A unique number identifing the `Hike`.
    var id: Int
    
    /// The name of the `Hike`.
    var name: String
    
    /// The length of the `Hike` in kilometers represented as a double.
    private var distance: Double
    
    /// The length of the `Hike` in miles.
    var distanceMiles: Measurement<UnitLength> {
        return distanceKilometers.converted(to: .miles)
    }
    
    /// The length of the `Hike` in kilometers.
    var distanceKilometers: Measurement<UnitLength> {
        return Measurement(value: distance, unit: UnitLength.kilometers)
    }
    
    /// The difficulty rating of the `Hike`. Higher rating, higher difficulty.
    var difficulty: Int
    
    
    var observations: [Observation]
    
    struct Observation: Hashable, Codable {
        /// The distance from the start the `Observation` was made.
        var distanceFromStart: Double
        
        /// The elevation reading at the moment of the `Observation`.
        var elevation: Range<Double>
        
        /// The pace reading of at the moment of the `Observation`.
        var pace: Range<Double>
        
        /// The heart rate reading at the moment of the `Observation`.
        var heartRate: Range<Double>
    }
}

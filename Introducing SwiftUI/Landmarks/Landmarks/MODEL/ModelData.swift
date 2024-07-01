//
//  ModelData.swift
//  Landmarks
//
//  Created by Taylor on 6/29/24.
//

import Foundation

@Observable
class ModelData {
    // MARK: - LANDMARK MODEL DATA
    /// The landmarks loaded from the included JSON data file.
    var landmarks: [Landmark] = load("landmarkData.json")
    
    /// The featured landmarks.
    var featuredLandmarks: [Landmark] {
        return landmarks.filter { $0.isFeatured }
    }
    
    /// A dictionary that groups landmarks by their category.
    var categoryGroupedLandmarks: [Landmark.Category : [Landmark]] {
        return Dictionary(grouping: landmarks) { $0.category }
    }
    
    // MARK: - HIKE MODEL DATA
    /// The hikes loaded from the included JSON data file.
    var hikes: [Hike] = load("hikeData.json")
}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

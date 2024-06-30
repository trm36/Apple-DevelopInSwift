//
//  Landmark.swift
//  Landmarks
//
//  Created by Taylor on 6/29/24.
//

import Foundation
import MapKit
import SwiftUI

struct Landmark: Hashable, Codable, Identifiable {
    
    /// A unique number identifing the `Landmark`.
    var id: Int
    
    /// The the name of the landmark.
    var name: String
    
    /// A description of the the landmark.
    var description: String
    
    /// The type of landmark.
    var category: String
    
    /// The park where the landmark is located.
    var park: String
    
    // MARK: - IMAGE PROPERTIES
    /// The filename of the image representing the landmark.
    private var imageName: String
    
    /// Returns the image associted with the `imageName` property.
    var image: Image {
        return Image(imageName)
    }
    
    // MARK: - LOCATION PROPERTIES
    /// The city where the landmark is located.
    var city: String
    
    /// The state where the landmark is located.
    var state: String
    
    /// The coordinates of the landmark.
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: coordinates.latitude,
                                      longitude: coordinates.longitude)
    }
    
    
    // MARK: - STATUS VARIABLES
    /// Indicates if the landmark is featured or not.
    var isFeatured: Bool
    
    /// Indicates if the landmark has been favorited or not.
    var isFavorite: Bool
}

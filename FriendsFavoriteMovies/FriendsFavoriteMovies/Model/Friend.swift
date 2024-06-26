//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by Taylor on 6/24/24.
//

import Foundation
import SwiftData

@Model
class Friend {
    /// A friend's full name.
    var name: String
    
    /// A friend's favorite movie.
    var favoriteMovie: Movie?
    
    init(name: String) {
        self.name = name
    }
    
    /// An array of `Friend` that contains sample data for testing.
    static let sampleData = [
        Friend(name: "Becca Smith"),
        Friend(name: "Caleb Smith"),
        Friend(name: "Aaron Jones"),
        Friend(name: "Alan Jones"),
        Friend(name: "Johnny Johnson"),
    ]
}

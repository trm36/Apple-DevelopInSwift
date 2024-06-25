//
//  Movie.swift
//  FriendsFavoriteMovies
//
//  Created by Taylor on 6/23/24.
//

import Foundation
import SwiftData

@Model
final class Movie {
    var title: String
    var releaseDate: Date
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    /// An array of `Movie` that contains sample data for testing.
    static let sampleData = [
        Movie(title: "Shaun of the Dead", releaseDate: Date(timeIntervalSince1970: 1095984000)),
        Movie(title: "Hot Fuzz", releaseDate: Date(timeIntervalSince1970: 1173830400)),
        Movie(title: "World's End, The", releaseDate: Date(timeIntervalSince1970: 1376352000)),
    ]
}

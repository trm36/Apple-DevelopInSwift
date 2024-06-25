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
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    /// An array of `Friend` that contains sample data for testing.
    static let sampleData = [
        Friend(name: "Becca"),
        Friend(name: "Caleb"),
        Friend(name: "Aaron"),
        Friend(name: "Alan"),
        Friend(name: "Johnny"),
    ]
}

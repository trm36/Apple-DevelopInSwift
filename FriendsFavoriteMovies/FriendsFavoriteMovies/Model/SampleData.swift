//
//  SampleData.swift
//  FriendsFavoriteMovies
//
//  Created by Taylor on 6/23/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    /// A globally shared SampleData
    static let shared: SampleData = SampleData()
    
    /// This model container will store the sample data in memory without persisting it.
    let modelContainer: ModelContainer
    
    /// A computed property to access the main context of the model container.
    var context: ModelContext {
        return modelContainer.mainContext
    }
    
    private init() {
        let schema = Schema([
            Movie.self,
            Friend.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    /// Inserts the same data into the model context.
    private func insertSampleData() {
        for movie in Movie.sampleData {
            context.insert(movie)
        }
        
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        
        do {
            try context.save()
        } catch {
            print("Sample data context failed to save.")
        }
    }
    
    /// Returns a single `Movie` for testing.
    var movie: Movie {
        return Movie.sampleData[0]
    }
    
    var friend: Friend {
        return Friend.sampleData[0]
    }
}

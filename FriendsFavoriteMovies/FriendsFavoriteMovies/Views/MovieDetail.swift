//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Taylor on 6/23/24.
//

import SwiftUI

struct MovieDetail: View {
    /// The `Movie` instance to display the details of.
    @Bindable var movie: Movie
    
    /// Indicates whether the detail view is displaying/editing a new `Movie` or an existing `Movie`.
    let isNew: Bool
    
    // MARK: - COMPUTED PROPERTIES
    var sortedFriends: [Friend] {
        return movie.favoritedBy.sorted { $0.name < $1.name }
    }
    
    // MARK: - ENVIRONMENT VARIABLES
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    // MARK: - INITIALIZERS
    init(movie: Movie, isNew: Bool = false) {
        self.movie = movie
        self.isNew = isNew
    }
    
    // MARK: - BODY
    var body: some View {
        Form {
            TextField("Movie Title", text: $movie.title)
            
            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
            
            if !movie.favoritedBy.isEmpty {
                Section("Favorited by") {
                    ForEach(sortedFriends) { friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle(isNew ? "New Movie" : "Movie Details")
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        modelContext.delete(movie)
                        dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEWS
#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Movie") {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
            .navigationBarTitleDisplayMode(.inline)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

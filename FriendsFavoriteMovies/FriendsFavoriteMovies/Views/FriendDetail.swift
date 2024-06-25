//
//  FriendDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Taylor on 6/25/24.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    /// The `Friend` instance to display the details of.
    @Bindable var friend: Friend
    
    /// Indicates whether the detail view is displaying/editing a new `Friend` or an existing `Friend`.
    let isNew: Bool
    
    // MARK: - ENVIRONMENT VARIABLES
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    // MARK: - QUERY VARIABLES
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    // MARK: - INITIALIZERS
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    // MARK: - BODY
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
            
            Picker("Favorite Movie", selection: $friend.favoriteMovie) {
                Text("None")
                    .tag(nil as Movie?)
                
                ForEach(movies) { movie in
                    Text(movie.title)
                        .tag(movie as Movie?)
                }
            }
        }
        .navigationTitle(isNew ? "New Friend" : "Friend Details")
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        modelContext.delete(friend)
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
        FriendDetail(friend: SampleData.shared.friend)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Friend") {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
            .navigationBarTitleDisplayMode(.inline)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

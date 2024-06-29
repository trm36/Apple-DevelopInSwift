//
//  FriendList.swift
//  FriendsFavoriteMovies
//
//  Created by Taylor on 6/25/24.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    // MARK: - ENVIRONMENT VARIABLES
    @Environment(\.modelContext) private var modelContext
    
    // MARK: - QUERY VARIABLES
    @Query private var friends: [Friend]
    
    // MARK: - STATE VARIABLES
    @State private var newFriend: Friend?
    
    // MARK: - INITIALIZERS
    init(nameFilter: String = "") {
        let predicate = #Predicate<Friend> { friend in
            return nameFilter.isEmpty || friend.name.localizedStandardContains(nameFilter)
        }
        
        _friends = Query(filter: predicate, sort: \Friend.name)
    }
    
    // MARK: - BODY
    var body: some View {
        Group {
            if friends.isEmpty {
                ContentUnavailableView {
                    Label("No Friends", systemImage: "person.and.person")
                }
            } else {
                List {
                    ForEach(friends) { friend in
                        NavigationLink {
                            FriendDetail(friend: friend)
                        } label: {
                            Text(friend.name)
                        }
                    }
                    .onDelete(perform: deleteFriends)
                }
            }
        }
        .navigationTitle("Friends")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button(action: addFriend) {
                    Label("Add Friend", systemImage: "plus")
                }
            }
        }
        .sheet(item: $newFriend) { friend in
            NavigationStack {
                FriendDetail(friend: friend, isNew: true)
            }
            .interactiveDismissDisabled()
        }
    }
    
    // MARK: - MODEL CONTROLLER FUNCTIONS
    private func addFriend() {
        withAnimation {
            let friend = Friend(name: "")
            modelContext.insert(friend)
            newFriend = friend
        }
    }
    
    private func deleteFriends(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(friends[index])
            }
        }
    }
}

// MARK: - PREVIEWS
#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("Empty State") {
    NavigationStack {
        FriendList()
            .modelContainer(for: Friend.self, inMemory: true)
    }
}

#Preview("Filtered") {
    NavigationStack {
        FriendList(nameFilter: "Smith")
            .modelContainer(SampleData.shared.modelContainer)
    }
}

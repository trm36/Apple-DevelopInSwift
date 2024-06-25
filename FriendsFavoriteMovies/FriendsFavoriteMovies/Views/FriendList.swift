//
//  FriendList.swift
//  FriendsFavoriteMovies
//
//  Created by Taylor on 6/25/24.
//

import SwiftUI
import SwiftData

struct FriendList: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Friend.name) private var friends: [Friend]
    @State private var newFriend: Friend?
    
    var body: some View {
        NavigationSplitView {
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
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
        }
    }
    
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

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}

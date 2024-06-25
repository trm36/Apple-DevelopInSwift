//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by Taylor on 6/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MovieList()
                .tabItem {
                    Label("Movies", systemImage: "film.stack")
                }
            
            FriendList()
                .tabItem {
                    Label("Friends", systemImage: "person.and.person")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}

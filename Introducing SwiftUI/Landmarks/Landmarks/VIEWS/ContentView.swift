//
//  ContentView.swift
//  Landmarks
//
//  Created by Taylor on 6/29/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - STATE VARIABLES
    @State private var selectedTab: Tab = .categories
    
    enum Tab {
        case categories
        case list
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CategoryHome()
                .tabItem { Label("Featured", systemImage: "star") }
                .tag(Tab.categories)
            
            LandmarkList()
                .tabItem { Label("List", systemImage: "list.bullet") }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

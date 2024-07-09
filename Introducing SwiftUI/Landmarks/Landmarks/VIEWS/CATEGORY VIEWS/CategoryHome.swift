//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Taylor on 7/1/24.
//

import SwiftUI

struct CategoryHome: View {
    // MARK: - ENVIRONMENT VARIABLES
    @Environment(ModelData.self) var modelData
    
    // MARK: - STATE VARIABLES
    /// Indicates whether the profile is currently showing or not.
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.featuredLandmarks.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())
                
                let categories = modelData.categoryGroupedLandmarks.keys
                let sortedCategories = categories.sorted { $0.rawValue < $1.rawValue }
                ForEach(sortedCategories, id: \.self) { category in
                    if let landmarks = modelData.categoryGroupedLandmarks[category] {
                        CategoryRow(category: category, categoryLandmarks: landmarks)
                    } else {
                        Text("404: Not Found")
                    }
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.grouped)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environment(modelData)
                }
            }
        } detail: {
            Text("Select a landmark.")
        }
        
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}

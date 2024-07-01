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
    
    var body: some View {
        NavigationSplitView {
            List {
                modelData.featuredLandmarks[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200.0)
                    .clipped()
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
        } detail: {
            Text("Select a landmark.")
        }
        
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}

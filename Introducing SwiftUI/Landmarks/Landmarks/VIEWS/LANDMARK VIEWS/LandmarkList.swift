//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Taylor on 6/29/24.
//

import SwiftUI

struct LandmarkList: View {
    // MARK: - ENVIRONMENT VARIABLES
    @Environment(ModelData.self) var modelData
    
    // MARK: - STATE VARIABLES
    /// Indicates whether the view should show only the favorite landmarks or all landmarks.
    @State private var showFavoritesOnly = false

    /// Indicates the currently selected filter.
    @State private var filter = FilterCategory.all

    // MARK: - FILTER LANDMARKS
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }

    // An array of Landmark that match the filter settings.
    var filteredLandmarks: [Landmark] {
        return modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }

    // A title for the navigation bar that matches the filter settings.
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(title)
            .frame(minWidth: 300.0)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}

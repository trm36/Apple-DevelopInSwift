//
//  LandmarkList.swift
//  WatchLandmarks Watch App
//
//  Created by Taylor on 7/11/24.
//

import SwiftUI

struct LandmarkList: View {
    // MARK: - ENVIRONMENT VARIABLES
    @Environment(ModelData.self) var modelData

    // MARK: - STATE VARIABLES
    /// Indicates whether the view should show only the favorite landmarks or all landmarks.
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        // Shows all when showFavoritesOnly is false, or shows favorite landmarks when showFavoritesOnly is true.
        return modelData.landmarks.filter { !showFavoritesOnly || $0.isFavorite }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}


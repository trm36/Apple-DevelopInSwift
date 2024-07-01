//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Taylor on 6/29/24.
//

import SwiftUI

struct LandmarkDetail: View {
    // MARK: - ENVIRONMENT VARIABLES
    @Environment(ModelData.self) var modelData
    
    /// The landmark to display the details of.
    var landmark: Landmark
    
    var landmarkIndex: Int? {
        return modelData.landmarks.firstIndex(where: {$0.id == landmark.id })
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300.0)
                
                CircleImage(image: landmark.image)
                    .offset(y: -130.0)
                    .padding(.bottom, -130.0)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex ?? -1].isFavorite)
                    }
                    
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    Text("About \(landmark.name)")
                        .font(.title2)
                    
                    Text(landmark.description)
                }
                .padding()
            }
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
}

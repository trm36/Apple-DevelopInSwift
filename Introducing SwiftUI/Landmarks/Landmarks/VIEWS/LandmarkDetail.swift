//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Taylor on 6/29/24.
//

import SwiftUI

struct LandmarkDetail: View {
    /// The landmark to display the details of.
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300.0)
                
                CircleImage(image: landmark.image)
                    .offset(y: -130.0)
                    .padding(.bottom, -130.0)
                
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.title)
                    
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
    LandmarkDetail(landmark: landmarks[0])
}

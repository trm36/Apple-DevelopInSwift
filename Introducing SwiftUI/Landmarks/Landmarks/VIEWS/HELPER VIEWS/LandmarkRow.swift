//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Taylor on 6/29/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50.0, height: 50.0)
            
            Text(landmark.name)
            
            Spacer()
        }
//        .padding()
    }
}

#Preview() {
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Taylor on 7/9/24.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

#Preview {
    FeatureCard(landmark: ModelData().featuredLandmarks[0])
        .aspectRatio(3.0 / 2.0, contentMode: .fit)
}

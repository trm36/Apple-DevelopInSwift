//
//  TextOverlay.swift
//  Landmarks
//
//  Created by Taylor on 7/9/24.
//

import SwiftUI

struct TextOverlay: View {
    var landmark: Landmark
    
    private var gradient: LinearGradient {
        let colorA = Color.black.opacity(0.6)
        let colorB = Color.black.opacity(0.0)
        let gradient = Gradient(colors: [colorA, colorB])
        
        return .linearGradient(gradient, startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    TextOverlay(landmark: ModelData().featuredLandmarks[0])
        .frame(height: 200.0)
}

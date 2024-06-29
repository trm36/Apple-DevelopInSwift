//
//  CircleImage.swift
//  Landmarks
//
//  Created by Taylor on 6/29/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4.0)
            }
            .shadow(radius: 7.0)
    }
}

#Preview {
    CircleImage()
}

//
//  FeatureCard.swift
//  OnboardingFlow
//
//  Created by Taylor on 6/17/24.
//

import SwiftUI

struct FeatureCard: View {
    let iconName: String
    let description: String
    
    var body: some View {
        HStack(spacing: 12.0) {
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50.0)
                .padding(.trailing, 5.0)
            Text(description)
            Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12.0)
                .foregroundStyle(.tint)
                .opacity(0.25)
                .brightness(-0.4)
        }
    }
}

#Preview {
    FeatureCard(iconName: "person.2.crop.square.stack.fill", description: "A multiline description about a feature paired with the image on the left.")
}

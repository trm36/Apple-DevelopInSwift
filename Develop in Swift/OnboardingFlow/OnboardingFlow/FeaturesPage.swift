//
//  FeaturesPage.swift
//  OnboardingFlow
//
//  Created by Taylor on 6/17/24.
//

import SwiftUI

struct FeaturesPage: View {
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Features")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.bottom)
                .padding(.top, 100.0)
            
            FeatureCard(iconName: "sportscourt.fill", description: "Tracks a of your games: goals, cards, and substitutions.")
            FeatureCard(iconName: "applewatch.watchface", description: "Keep track of playing time, stoppage time and all stats right from your Apple Watch.")
            
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    FeaturesPage()
        .frame(maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
        .foregroundStyle(.white)
}

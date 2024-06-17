//
//  WelcomePage.swift
//  OnboardingFlow
//
//  Created by Taylor on 6/17/24.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30.0)
                    .frame(width: 150.0, height: 150.0)
                    .foregroundStyle(.purple)
                Image(systemName: "figure.soccer")
                    .font(.system(size: 70.0))
                    .foregroundStyle(.black)
            }
            Text("Welcome to MyApp")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.top)
                .border(.black, width: 1.5)
            Text("Developed in the Redwoods")
                .font(.title2)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .border(.black, width: 1.5)
        }
        .border(.red, width: 1.5)
        .padding()
        .border(.orange, width: 1.5)
    }
}

#Preview {
    WelcomePage()
}

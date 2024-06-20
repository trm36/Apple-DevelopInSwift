//
//  DiceView.swift
//  DiceRoller
//
//  Created by Taylor on 6/19/24.
//

import SwiftUI

struct DiceView: View {
    @State var numberOfPips: Int = 6
    
    var body: some View {
        VStack(spacing: 12.0) {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(maxWidth: 100.0, maxHeight: 100.0)
                .aspectRatio(1.0, contentMode: .fit)
                .foregroundStyle(.black, .white)
                
            
            Button("Roll") {
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DiceView()
        .font(.largeTitle)
}

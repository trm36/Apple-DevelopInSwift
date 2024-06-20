//
//  ContentView.swift
//  DiceRoller
//
//  Created by Taylor on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice: Int = 3
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle
                    .lowercaseSmallCaps()
                    .bold())
                .foregroundStyle(.tint)
            
            HStack {
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()
                }
            }
            
            HStack {
                Spacer()
                
                Button("Remove Dice", systemImage: "minus.square.fill") {
                    numberOfDice -= 1
                }
                .disabled(numberOfDice == 1)
                
                Spacer()
                
                Button("Add Dice", systemImage: "plus.square.fill") {
                    numberOfDice += 1
                }
                .disabled(numberOfDice == 5)
                
                Spacer()
            }
            .padding()
            .labelStyle(.iconOnly)
            .font(.largeTitle)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)
        .tint(.white)
        
    }
}

#Preview {
    ContentView()
}

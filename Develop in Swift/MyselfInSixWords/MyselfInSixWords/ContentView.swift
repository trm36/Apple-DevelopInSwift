//
//  ContentView.swift
//  MyselfInSixWords
//
//  Created by Taylor on 6/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 25.0) {
            HStack(spacing: 25.0) {
                Text("Programmer")
                    .padding()
                    .background(Color.red, in: RoundedRectangle(cornerRadius: 8.0))
                Text("Crocheter")
                    .padding()
                    .background(Color.orange, in: RoundedRectangle(cornerRadius: 8.0))
            }
            HStack(spacing: 25.0) {
                Text("Referee")
                    .padding()
                    .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8.0))
                Text("Nature Enthusiast")
                    .padding()
                    .background(Color.green, in: RoundedRectangle(cornerRadius: 8.0))
            }
            HStack(spacing: 25.0) {
                Text("Bicyclist")
                    .padding()
                    .background(Color.blue, in: RoundedRectangle(cornerRadius: 8.0))
                Text("Single")
                    .padding()
                    .background(Color.purple, in: RoundedRectangle(cornerRadius: 8.0))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

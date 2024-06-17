//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Taylor on 6/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 25.0) {
            Text("Hello, Malcolm")
                .padding()
                .background(Color.red, in: RoundedRectangle(cornerRadius: 8.0))
                .shadow(radius: 10.0)
            Text("Placeholder")
                .padding()
                .background(Color.teal, in: RoundedRectangle(cornerRadius: 8.0))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

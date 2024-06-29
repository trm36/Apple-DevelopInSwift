//
//  ContentView.swift
//  TunnelOfCircles
//
//  Created by Taylor on 6/26/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - STATE PROPERTIES
    @State private var colors: [Color] = [.indigo, .blue]
    @State private var depth = 0.0
    
    // MARK: - CONSTANTS
    let minDiameter = 50.0
    let diameterChange = 70.0
    
    var body: some View {
        VStack(spacing: 40.0) {
            Text("Tunnel of Circles")
                .font(.largeTitle)
                .padding()
            
            ZStack {
                ForEach(0..<4) { i in
                    Circle()
                        .stroke(lineWidth: 30.0)
                        .foregroundStyle(colors[i % colors.count])
                        .frame(height: (diameterChange * Double(i)) + minDiameter)
                        .padding3D(.back, depth)
                }
            }
            .padding(.bottom, 30)
            
            Grid {
                GridRow {
                    Text("Depth")
                    Slider(value: $depth, in: 0...50) {
                        Text("Depth")
                    }
                }
                
                GridRow {
                    Text("Colors")
                    
                    HStack {
                        ColorPicker("Color", selection: $colors[0])
                        ColorPicker("Color", selection: $colors[1])
                        Spacer()
                    }
                    .labelsHidden()
                }
            }
            .padding(30.0)
            .background(.thickMaterial)
            .frame(maxWidth: 320.0)
        }
        .frame(minHeight: 560.0)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

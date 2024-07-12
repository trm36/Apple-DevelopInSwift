//
//  LandmarkSettings.swift
//  MacLandmarks
//
//  Created by Taylor on 7/11/24.
//

import SwiftUI

struct LandmarkSettings: View {

    @AppStorage("MapView.zoom") private var zoom: MapView.Zoom = .medium

    var body: some View {
        Form {
            Picker("Map Zoom:", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300.0)
        .navigationTitle("Landmark Settings")
        .padding(80.0)
    }
}

#Preview {
    LandmarkSettings()
}

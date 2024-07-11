//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Taylor on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700.0, minHeight: 300.0)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

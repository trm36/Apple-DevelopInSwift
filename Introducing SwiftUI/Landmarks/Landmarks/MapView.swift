//
//  MapView.swift
//  Landmarks
//
//  Created by Taylor on 6/29/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }
    
    ///The region information for the map.
    private var region: MKCoordinateRegion {
        let center = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            
        return MKCoordinateRegion(center: center, span: span)
    }
}

#Preview {
    MapView()
}

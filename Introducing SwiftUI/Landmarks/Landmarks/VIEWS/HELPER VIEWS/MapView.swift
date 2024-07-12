//
//  MapView.swift
//  Landmarks
//
//  Created by Taylor on 6/29/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D

    @AppStorage("MapView.zoom") private var zoom: Zoom = .medium

    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"

        var id: Zoom {
            return self
        }

        var delta: CLLocationDegrees {
            switch self {
            case .near:
                return 0.02
            case .medium:
                return 0.2
            case .far:
                return 2
            }
        }
    }

    var body: some View {
        Map(position: .constant(.region(region)))
    }
    
    ///The region information for the map.
    private var region: MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: zoom.delta, longitudeDelta: zoom.delta)
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}

#Preview {
    let c = CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
    return MapView(coordinate: c)
}

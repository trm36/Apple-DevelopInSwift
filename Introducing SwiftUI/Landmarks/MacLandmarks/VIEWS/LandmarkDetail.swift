//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by Taylor on 7/10/24.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    // MARK: - ENVIRONMENT VARIABLES
    @Environment(ModelData.self) var modelData

    /// The landmark to display the details of.
    var landmark: Landmark

    var landmarkIndex: Int? {
        return modelData.landmarks.firstIndex(where: {$0.id == landmark.id })
    }

    var body: some View {
        @Bindable var modelData = modelData

        ScrollView {
            // MAP
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300.0)

                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }

            // LANDMARK DETAILS
            VStack(alignment: .leading, spacing: 10.0) {
                // HEADER (IMAGE + TITLE)
                HStack(spacing: 24.0) {
                    // HEADER IMAGE
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160.0, height: 160.0)

                    // HEADER TITLE
                    VStack(alignment: .leading) {
                        // LANDMARK NAME
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex ?? -1].isFavorite)
                                .buttonStyle(.plain)
                        }

                        // PARK DETAILS
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    } // END HEADER TITLE
                } // END HEADER (IMAGE + TITLE)

                Divider()
                    .padding(.vertical)

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)

            } // END LANDMARK DETAILS
            .offset(y: -50.0)
            .padding()
            .frame(maxWidth: 700.0)
        }// END SCROLL VIEW
        .navigationTitle(landmark.name)
    }
}


#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
}

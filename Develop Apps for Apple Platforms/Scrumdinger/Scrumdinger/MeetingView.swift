//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Taylor on 7/11/24.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 10.0, total: 15.0)

            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")

            Circle()
                .strokeBorder(lineWidth: 24.0)

            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button {
                    // TODO: ADD BUTTON ACTION - advance the timer ring to the next speaker
                } label: {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next speaker")
            }
        }
        .padding()
    }
}

#Preview {
    MeetingView()
}

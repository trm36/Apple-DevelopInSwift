//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Taylor on 7/21/24.
//

import SwiftUI

struct HistoryView: View {
    /// The history that will be displayed on the detail view.
    let history: History

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {

                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date.formatted(date: .abbreviated, time: .shortened)))
        .padding()
    }
}

#Preview {
    HistoryView(history: History.sampleHistory)
}

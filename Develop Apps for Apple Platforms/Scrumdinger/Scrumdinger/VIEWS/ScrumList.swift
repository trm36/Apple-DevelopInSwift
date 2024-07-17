//
//  ScrumList.swift
//  Scrumdinger
//
//  Created by Taylor on 7/16/24.
//

import SwiftUI

struct ScrumList: View {
    /// The scrums to display on the Scrum List.
    let scrums: [DailyScrum]

    var body: some View {
        NavigationStack {
            List(scrums) { scrum in
                NavigationLink(destination: ScrumDetail(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Scrums")
            .toolbar {
                Button {
                    // TODO: ADD BUTTON ACTION - create a new scrum
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

struct ScrumsList_Previews: PreviewProvider {
    /// An array of scrums using the sample data.
    static var scrums: [DailyScrum] = DailyScrum.sampleData

    static var previews: some View {
        ScrumList(scrums: scrums)
    }
}

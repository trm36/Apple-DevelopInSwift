//
//  ScrumsList.swift
//  Scrumdinger
//
//  Created by Taylor on 7/16/24.
//

import SwiftUI

struct ScrumsList: View {
    /// The scrums to display on the Scrum List.
    let scrums: [DailyScrum]

    var body: some View {
        List(scrums) {
            CardView(scrum: $0)
                .listRowBackground($0.theme.mainColor)
        }
    }
}

struct ScrumsList_Previews: PreviewProvider {
    /// An array of scrums using the sample data.
    static var scrums: [DailyScrum] = DailyScrum.sampleData

    static var previews: some View {
        ScrumsList(scrums: scrums)
    }
}

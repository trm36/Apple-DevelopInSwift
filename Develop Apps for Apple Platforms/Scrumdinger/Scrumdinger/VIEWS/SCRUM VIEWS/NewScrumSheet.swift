//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Taylor on 7/18/24.
//

import SwiftUI

struct NewScrumSheet: View {
    /// Hold the new Scrum data.
    @State private var newScrum = DailyScrum.emptyScrum

    /// Holds all the scrums that the new scrum will be added to.
    @Binding var scrums: [DailyScrum]

    /// Indicates whether this sheet is being presented as a new `Scrum` view.
    @Binding var isPresentingNewScrumView: Bool

    var body: some View {
        NavigationStack {
            ScrumEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }
                }
                .navigationTitle("New Scrum")
        }
    }
}

#Preview {
    NewScrumSheet(scrums: .constant(DailyScrum.sampleData), isPresentingNewScrumView: .constant(true))
}

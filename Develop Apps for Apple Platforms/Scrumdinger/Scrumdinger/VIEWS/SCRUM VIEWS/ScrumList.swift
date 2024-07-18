//
//  ScrumList.swift
//  Scrumdinger
//
//  Created by Taylor on 7/16/24.
//

import SwiftUI

struct ScrumList: View {

    /// Used to view the operational state of the App's scene.
    @Environment(\.scenePhase) private var scenePhase

    /// The scrums to display on the Scrum List.
    @Binding var scrums: [DailyScrum]

    /// Indicates if the view is presenting a View to create a new scrum.
    ///
    /// Controls the presentation of the edit view to create a new scrum.
    @State private var isPresentingNewScrumView = false

    ///
    let saveAction: () -> Void

    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: ScrumDetail(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Scrums")
            .toolbar {
                Button {
                    isPresentingNewScrumView = true
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ScrumsList_Previews: PreviewProvider {
    /// An array of scrums using the sample data.
    static var scrums: [DailyScrum] = DailyScrum.sampleData

    static var previews: some View {
        ScrumList(scrums: .constant(scrums), saveAction: {})
    }
}

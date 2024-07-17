//
//  ScrumDetail.swift
//  Scrumdinger
//
//  Created by Taylor on 7/16/24.
//

import SwiftUI

struct ScrumDetail: View {
    /// The scrum to display the details of.
    let scrum: DailyScrum

    // MARK: - STATE VARIABLES
    /// Indicates if this view is presenting the edit view.
    @State private var isPresentingEditView: Bool = false

    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundStyle(Color.accentColor)
                }

                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)

                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4.0)
                        .foregroundStyle(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .clipShape(RoundedRectangle(cornerRadius: 4.0))

                }
                .accessibilityElement(children: .combine)
            }

            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                ScrumEditView()
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                // TODO: - ADD BUTTON ACTION - Save edited scrum data
                                isPresentingEditView = false
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    let scrum = DailyScrum.sampleData[0]
    return NavigationStack {
        ScrumDetail(scrum: scrum)
            .navigationTitle(scrum.title)
    }
}

//
//  ScrumDetail.swift
//  Scrumdinger
//
//  Created by Taylor on 7/16/24.
//

import SwiftUI

struct ScrumDetail: View {
    /// The scrum to display the details of.
    @Binding var scrum: DailyScrum

    // MARK: - STATE VARIABLES
    /// Indicates if this view is presenting the edit view.
    @State private var isPresentingEditView: Bool = false

    /// A copy of the scrum to be used for editing.
    ///
    /// This empty scrum is updated to match the selected scrum
    /// when the user taps the Edit button. If the user, cancels
    /// this data will be discarded. If the user saves the changes,
    /// we'll use the changed data in this scrum to update the source
    /// of truth.
    @State private var editingScrum = DailyScrum.emptyScrum

    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
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
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                ScrumEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                                editingScrum = .emptyScrum
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                // TODO: - ADD BUTTON ACTION - Save edited scrum data
                                isPresentingEditView = false
                                scrum = editingScrum
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
        ScrumDetail(scrum: .constant(scrum))
            .navigationTitle(scrum.title)
    }
}

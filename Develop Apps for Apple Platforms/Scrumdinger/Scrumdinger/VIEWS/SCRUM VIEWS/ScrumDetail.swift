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
            } // END MEETING INFO SECTION

            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            } // END ATTENDEES SECTION

            Section(header: Text("History")) {
                if scrum.histories.isEmpty {
                    Label("No meetings", systemImage: "calendar.badge.exclamationmark")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(scrum.histories) { history in
                        NavigationLink(destination: HistoryView(history: history)) {
                            HStack {
                                Image(systemName: "calendar")
                                Text(history.date, style: .date)
                            }
                        }
                    }
                }
            } // END HISTORY SECTION
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

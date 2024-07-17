//
//  ScrumEditView.swift
//  Scrumdinger
//
//  Created by Taylor on 7/17/24.
//

import SwiftUI

struct ScrumEditView: View {
    /// The scrum to display the details of.
    @Binding var scrum: DailyScrum

    /// Holds the name of a new attendee.
    @State private var newAttendeeName = ""

    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)

                HStack {
                    Slider(value: $scrum.lengthInMintuesDouble, in: 5...30) {
                        Text("Meeting Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")

                    Spacer()

                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }

                ThemePicker(selectedTheme: $scrum.theme)
            } // END MEETING INFO SECTION

            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete {
                    scrum.attendees.remove(atOffsets: $0)
                }

                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button {
                        withAnimation {
                            let name = newAttendeeName.trimmingCharacters(in: .whitespacesAndNewlines)
                            guard !name.isEmpty else { return }
                            let attendee = Attendee(name: name)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            } // END ATTENDEES SECTION
        }
    }
}

#Preview {
    return NavigationStack {
        ScrumEditView(scrum: .constant(DailyScrum.sampleData[0]))
            .navigationTitle("New Scrum")
    }
}

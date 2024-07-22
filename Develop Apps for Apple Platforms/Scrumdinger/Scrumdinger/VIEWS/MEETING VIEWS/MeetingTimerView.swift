//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Taylor on 7/20/24.
//

import SwiftUI

struct MeetingTimerView: View {
    /// An array of speakers to be displayed on the timer.
    let speakers: [ScrumTimer.Speaker]

    /// The theme associated with the timer.
    let theme: Theme

    /// Indicates if the meeting is currently recording.
    let isRecording: Bool

    /// Calculates the current speaker to display on the timer.
    ///
    /// The current speaker is the first person on the list who hasn’t spoken.
    /// If there isn’t a current speaker, the expression returns “Someone.”
    private var currentSpeaker: String {
        return speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }

    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24.0)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                    if isRecording {
                        Image(systemName: "mic")
                            .foregroundStyle(.red)
                            .padding(.top, 1.0)
                            .accessibilityLabel("with transcription.")
                    } else {
                        Image(systemName: "mic.slash")
                            .padding(.top, 1.0)
                            .accessibilityLabel("without transcription")
                    }
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, speakerCount: speakers.count)
                            .rotation(Angle(degrees: -90.0))
                            .stroke(theme.mainColor, lineWidth: 12.0)
                    }
                }
            }
            .padding(.horizontal)
    }
}

#Preview {
    MeetingTimerView(speakers: ScrumTimer.Speaker.sampleSpeakers, theme: .yellow, isRecording: false)
}

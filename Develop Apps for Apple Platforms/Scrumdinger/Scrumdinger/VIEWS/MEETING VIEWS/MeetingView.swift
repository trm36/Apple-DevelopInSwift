//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Taylor on 7/11/24.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    /// The scrum associated with this meeting view.
    @Binding var scrum: DailyScrum

    /// The scrum timer used for this meeting view.
    @StateObject var scrumTimer = ScrumTimer()

    /// The speech recognizer used for this meeting view.
    @StateObject var speechRecognizer = SpeechRecognizer()

    ///Indicates if the app is recording.
    @State private var isRecording = false

    private var player: AVPlayer {
        return AVPlayer.sharedDingPlayer
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)

            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                  secondsRemaining: scrumTimer.secondsRemaining,
                                  theme: scrum.theme)

                MeetingTimerView(speakers: scrumTimer.speakers, theme: scrum.theme, isRecording: isRecording)
                    .padding(.horizontal, 8.0)

                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            startScrum()
        }
        .onDisappear {
            stopScrum()
        }
    }

    /// Starts the scrum, making necessary changes.
    private func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
        speechRecognizer.resetTranscript()
        speechRecognizer.startTranscribing()
        isRecording = true
        scrumTimer.startScrum()
    }

    /// Stops the scrum, making necessary changes.
    private func stopScrum() {
        scrumTimer.stopScrum()
        speechRecognizer.stopTranscribing()
        isRecording = false
        let newHistory = History(attendees: scrum.attendees, transcript: speechRecognizer.transcript)
        scrum.histories.insert(newHistory, at: 0)
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}

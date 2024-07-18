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

                Circle()
                    .strokeBorder(lineWidth: 24.0)
                    .padding(.horizontal, 8.0)

                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
            scrumTimer.startScrum()
        }
        .onDisappear {
            scrumTimer.stopScrum()
        }
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}

//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Taylor on 7/18/24.
//

import SwiftUI

struct MeetingHeaderView: View {
//    /// The scrum associated with this meeting header view.
//    @Binding var scrum: DailyScrum

    /// The number of seconds elapsed to display in the header.
    let secondsElapsed: Int

    /// The number of seconds remaining to display in the header.
    let secondsRemaining: Int

    /// The theme associated with the header view.
    let theme: Theme


    // MARK: - COMPUTED PROPERTIES

    /// The total number of seconds in the meeting.
    ///
    /// Calcuated from the `secondsElapsed` and the `secondsRemaining`.
    private var totalSeconds: Int {
        return secondsElapsed + secondsRemaining
    }

    /// The progress of the timer.
    ///
    /// Calcuated from the `secondsElapsed`, the `secondsRemaining`, and the `totalSeconds`.
    private var progress: Double {
        guard totalSeconds > 0 else { return 1.0 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }

    /// The number of minutes left in the meeting.
    ///
    /// Used for the VoiceOver.
    private var minutesRemaining: Int {
        return secondsRemaining / 60
    }

    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))

            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .padding([.top, .horizontal])
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")

    }
}

#Preview {
    MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme: .bubblegum)
        .previewLayout(.sizeThatFits)
}

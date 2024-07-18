//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Taylor on 7/18/24.
//

import SwiftUI

struct MeetingFooterView: View {

    /// The speakers associated with this footer view.
    let speakers: [ScrumTimer.Speaker]

    /// An action to perform when the skip button is pressed.
    var skipAction: (() -> Void)

    /// Indicates the first incomplete speaker's number.
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }

    /// Indicates whether the active speaker is the last speaker.
    ///
    /// This property is `true` if the `isCompleted` property of each
    /// speaker except the final speaker is `true`.
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }

    /// Returns the display text with information about the active speaker.
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers." }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }

    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

#Preview {
    MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
        .previewLayout(.sizeThatFits)
//        .background()
//        .backgroundStyle(Color.red)
}

//
//  History.swift
//  Scrumdinger
//
//  Created by Taylor on 7/18/24.
//

import Foundation

struct History: Identifiable, Codable {
    /// A unique string that identifies the `History` instance.
    let id: UUID

    /// The date of the meeting.
    let date: Date

    /// The attendees listed on the meeting.
    let attendees: [Attendee]

    /// The transcript of the meeting, if available.
    var transcript: String?

    /// Initializes a new `History`.
    init(id: UUID = UUID(), date: Date = Date(), attendees: [Attendee], transcript: String? = nil) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.transcript = transcript
    }
}

extension History {
    /// Returns the attendees data into a single, comma-separated string.
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}

// MARK: - SAMPLE DATA
extension History {
    /// Returns a sample `History` instance for testing.
    static var sampleHistory: History {
        return History(attendees: Attendee.sampleAttendees, transcript: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    }
}

//
//  History.swift
//  Scrumdinger
//
//  Created by Taylor on 7/18/24.
//

import Foundation

struct History: Identifiable {
    /// A unique string that identifies the `History` instance.
    let id: UUID

    /// The date of the meeting.
    let date: Date

    /// The attendees listed on the meeting.
    let attendees: [Attendee]

    /// Initializes a new `History`.
    init(id: UUID = UUID(), date: Date = Date(), attendees: [Attendee]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}

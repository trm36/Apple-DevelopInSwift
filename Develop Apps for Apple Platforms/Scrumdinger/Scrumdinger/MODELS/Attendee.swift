//
//  Attendee.swift
//  Scrumdinger
//
//  Created by Taylor on 7/16/24.
//

import Foundation

struct Attendee: Identifiable, Codable {
    /// A UUID that uniquely identifies the attendee.
    let id: UUID

    /// The name of the attendee.
    let name: String

    /// Initializes a new Attendee with a new unique ID.
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}

extension Attendee {
    /// Returns an array of three sample `Attendee`s for testing.
    static var sampleAttendees: [Attendee] {
        return [
            Attendee(name: "Richard"),
            Attendee(name: "Joann"),
            Attendee(name: "Tina"),
        ]
    }
}

//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Taylor on 7/16/24.
//

import Foundation

struct DailyScrum: Identifiable, Codable {
    /// A UUID that uniquely identifies the scrum.
    var id: UUID

    /// The title of the daily scrum.
    var title: String

    /// The attendees of the scrum.
    var attendees: [Attendee]

    /// The length of the scrum, in minutes.
    var lengthInMinutes: Int

    /// The length of the scrum, in minutes represented as a `Double`.
    var lengthInMintuesDouble: Double {
        get { Double(lengthInMinutes) }
        set { lengthInMinutes = Int(newValue) }
    }

    /// The `Theme` of the scrum.
    var theme: Theme

    /// An array of History objects that records each meeting associated with this scrum.
    var histories: [History] = []

    /// Initializes a new Daily Scrum with a new unique ID.
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.compactMap { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design",
                   attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyScrum(title: "App Dev",
                   attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                   attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                   lengthInMinutes: 5,
                   theme: .poppy),
    ]

    /// Creates a new empty/default scrum.
    static var emptyScrum: DailyScrum {
        return DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}

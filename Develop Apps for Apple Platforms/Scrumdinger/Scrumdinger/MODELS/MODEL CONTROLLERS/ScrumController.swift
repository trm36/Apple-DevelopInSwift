//
//  ScrumController.swift
//  Scrumdinger
//
//  Created by Taylor on 7/18/24.
//

import SwiftUI

@MainActor
class ScrumController: ObservableObject {
    
    /// The source of truth for `Scrum`s throughout the app.
    @Published var scrums: [DailyScrum] = []


    /// Provides the file URL of the saved data location.
    private static func fileURL() throws -> URL {
        let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        return url.appending(path: "scrums.data")
    }

    /// Loads the scrum data from disk.
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }

            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }

        scrums = try await task.value
    }

    /// Saves the scrum data to disk.
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }

        _ = try await task.value
    }
}

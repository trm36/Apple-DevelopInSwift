//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Taylor on 7/11/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    /// Initializes the shared scrum controller.
    @StateObject private var scrumController = ScrumController()

    var body: some Scene {
        WindowGroup {
            ScrumList(scrums: $scrumController.scrums, saveAction: {
                Task {
                    do {
                        try await scrumController.save(scrums: scrumController.scrums)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            })
                .task {
                    do {
                        try await scrumController.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}

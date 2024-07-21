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

    /// asdf
    @State private var errorWrapper: ErrorWrapper?

    var body: some Scene {
        WindowGroup {
            ScrumList(scrums: $scrumController.scrums, saveAction: {
                Task {
                    do {
                        try await scrumController.save(scrums: scrumController.scrums)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                    }
                }
            })
            .task {
                do {
                    try await scrumController.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                scrumController.scrums = DailyScrum.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}

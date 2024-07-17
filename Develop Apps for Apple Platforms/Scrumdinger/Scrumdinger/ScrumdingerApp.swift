//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Taylor on 7/11/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        WindowGroup {
            ScrumList(scrums: $scrums)
        }
    }
}

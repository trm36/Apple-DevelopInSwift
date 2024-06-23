//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Taylor on 6/22/24.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}

//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Taylor on 6/29/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif

        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif

        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}

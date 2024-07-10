//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Taylor on 7/9/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .task {
                // REQUEST NOTIFICATION PERMISSION
                _ = try? await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
            }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

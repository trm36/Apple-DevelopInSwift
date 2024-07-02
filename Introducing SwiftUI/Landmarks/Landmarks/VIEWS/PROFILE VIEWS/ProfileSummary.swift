//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Taylor on 7/1/24.
//

import SwiftUI

struct ProfileSummary: View {
    // MARK: - ENVIRONMENT VARIABLES
    @Environment(ModelData.self) var modelData
    
    /// The profile to display in the summary.
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10.0) {
                // PROFILE DATA
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                let notificationPreference = profile.prefersNotifications ? "On" : "Off"
                Text("Notifications: \(notificationPreference)")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                // COMPLETED BADGES
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90.0))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45.0))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                //HIKE VIEW
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}

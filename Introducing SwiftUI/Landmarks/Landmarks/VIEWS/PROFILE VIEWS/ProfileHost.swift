//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Taylor on 7/1/24.
//

import SwiftUI

struct ProfileHost: View {
    // MARK: - STATE VARIABLES
    /// Holds the draft profile.
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
}

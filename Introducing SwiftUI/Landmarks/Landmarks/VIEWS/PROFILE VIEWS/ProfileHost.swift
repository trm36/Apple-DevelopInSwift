//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Taylor on 7/1/24.
//

import SwiftUI

struct ProfileHost: View {
    // MARK: - ENVIRONMENT VARIABLES
    @Environment(ModelData.self) var modelData
    @Environment(\.editMode) var editMode
    
    // MARK: - STATE VARIABLES
    /// Holds the draft profile.
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}

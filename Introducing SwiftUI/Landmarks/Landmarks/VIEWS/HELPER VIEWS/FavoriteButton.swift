//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Taylor on 6/30/24.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .secondary)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}

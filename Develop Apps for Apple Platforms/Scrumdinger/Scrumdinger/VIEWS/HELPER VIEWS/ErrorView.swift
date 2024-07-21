//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Taylor on 7/20/24.
//

import SwiftUI

struct ErrorView: View {

    @Environment(\.dismiss) private var dismiss

    /// The error wrapper containing the information to display.
    let errorWrapper: ErrorWrapper

    var body: some View {
        NavigationStack {
            VStack(spacing: 8.0) {
                Label("An error has occurred!", systemImage: "exclamationmark.triangle.fill")
                    .labelStyle(.topIcon)
                    .font(.title)
                VStack(alignment: .leading, spacing: 8.0) {
                    Text(errorWrapper.error.localizedDescription)
                        .font(.headline)
                    Text(errorWrapper.guidance)
                }
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16.0)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ErrorView(errorWrapper: ErrorWrapper.sampleErrorWrapper)
}

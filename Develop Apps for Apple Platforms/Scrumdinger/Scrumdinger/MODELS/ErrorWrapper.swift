//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Taylor on 7/20/24.
//

import Foundation

struct ErrorWrapper: Identifiable {

    /// An ID string (`UUID`) that uniquely identifies the error.
    var id: UUID

    /// The `Error` that occurred.
    var error: Error

    /// The user-facing string offerring the user guidance.
    let guidance: String

    /// Initializes a new `ErrorWrapper`.
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}

// MARK: - SAMPLE DATA
extension ErrorWrapper {
    enum SampleError: Error {
        case errorRequired
    }

    static var sampleErrorWrapper: ErrorWrapper {
        return ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safely ignore this error.")
    }
}

//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by Taylor on 7/20/24.
//

import SwiftUI

struct SpeakerArc: Shape {
    
    /// The current speakers index.
    ///
    /// Indicates how many segments to draw.
    let speakerIndex: Int

    /// The total number of speakers.
    ///
    /// The number of arc segments on the speaker count.
    let speakerCount: Int

    /// Calculates the degrees of a single arc.
    private var degreesPerSpeaker: Double {
        return 360.0 / Double(speakerCount)
    }

    /// The start angle of the arc.
    ///
    /// The additional 1.0 degree is for visual separtion between arc segments.
    private var startAngle: Angle {
        return Angle(degrees: (degreesPerSpeaker * Double(speakerIndex)) + 1.0)
    }

    /// The end angle of the arc.
    ///
    /// The subtracted degree is for visual separtion between arc segments.
    private var endAngle: Angle {
        return Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }

    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)

        }
    }
}

#Preview {
    SpeakerArc(speakerIndex: 3, speakerCount: 5)
}

//
//  CardView.swift
//  Scrumdinger
//
//  Created by Taylor on 7/16/24.
//

import SwiftUI

struct CardView: View {
    /// The scrum to display on the CardView.
    let scrum: DailyScrum

    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)

            Spacer()

            HStack {
                let count = scrum.attendees.count
                Label("\(count)", systemImage: "person.3")
                    .accessibilityLabel("\(count) attendees")

                Spacer()

                let lengthInMinutes = scrum.lengthInMinutes
                Label("\(lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
                    .padding(.trailing, 20.0)
            }
            .font(.caption)
        }
        .foregroundStyle(scrum.theme.accentColor)
        .padding(8.0)
    }
}


struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]

    static var previews: some View {
        CardView(scrum: scrum)
            .background(.yellow)
            .previewLayout(.fixed(width: 400.0, height: 60.0))
    }
}

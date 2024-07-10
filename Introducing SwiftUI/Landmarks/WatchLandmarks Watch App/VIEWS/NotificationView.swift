//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by Taylor on 7/9/24.
//

import SwiftUI

struct NotificationView: View {
    /// A string representing the title of the notification.
    var title: String?
    
    /// A string representing the body of the notification.
    var message: String?
    
    /// The landmark represented by the notification.
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if let landmark {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
    }
}

#Preview {
    NotificationView()
}

#Preview("Turtle Rock") {
    NotificationView(title: "Turtle Rock", message: "You are within 5 miles of Turtle Rock.", landmark: ModelData().landmarks[0])
}

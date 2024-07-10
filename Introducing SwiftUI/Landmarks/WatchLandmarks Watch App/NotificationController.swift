//
//  NotificationController.swift
//  WatchLandmarks Watch App
//
//  Created by Taylor on 7/9/24.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    /// A string representing the title of the notification.
    var title: String?
    
    /// A string representing the body of the notification.
    var message: String?
    
    /// The landmark represented by the notification.
    var landmark: Landmark?
    
    let landmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        NotificationView(title: title, message: message, landmark: landmark)
    }
    
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()
        
        guard let notificationData = notification.request.content.userInfo as? [String : Any], let aps = notificationData["aps"] as? [String : Any], let alert = aps["alert"] as? [String : Any] else { return }
        
        title = alert["title"] as? String
        message = alert["message"] as? String
        
        guard let index = notificationData[landmarkIndexKey] as? Int else { return }
        
        landmark = modelData.landmarks[index]
    }
}

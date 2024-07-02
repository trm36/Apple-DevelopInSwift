//
//  Profile.swift
//  Landmarks
//
//  Created by Taylor on 7/1/24.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications: Bool = true
    var seasonalPhoto: Season = .winter
    var goalDate: Date = Date()
    
    static let `default` = Profile(username: "b_sullivan")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍁"
        case winter = "⛄️"
        
        var id: String { rawValue }
    }
}

//
//  Model.swift
//  SmartHomeMiniApp
//
//  Created by Jamorn Suttipong on 9/9/2567 BE.
//

import Foundation

// categories
enum Categories: String, Identifiable, CaseIterable {
    case bedroom = "Bedroom"
    case livingRoom = "Living Room"
    case diningRoom = "Dining Room"
    case familyRoom = "Family Room"
    case bathRoom = "BathRoom"
    
    var id: String { self.rawValue }
}

//toggle
enum ToggleModel: String, CaseIterable, Identifiable {
    case tv = "tv"
    case vacuum = "power"
    case lamp = "lamp.ceiling"
    case speaker = "speaker.wave.3.fill"
    
    var id: String { self.rawValue }
    
    var title: String {
        switch self {
        case .tv: "Smart TV"
        case .vacuum: "Vacuum Cleaner"
        case .lamp: "Smart Lamp"
        case .speaker: "Smart Speaker"
        }
    }
    
    var description: String {
        switch self {
        case .tv: "LG C3 OLED"
        case .vacuum: "Robot vacuum 4D"
        case .lamp: "Smart LED Bulb"
        case .speaker: "Apple 3 Smart Speaker"
        }
    }
}

//tab bar
enum TabBarModel: String, CaseIterable {
    case home = "house.fill"
    case viewRoom = "display"
    case setting = "gearshape.fill"
    case profile = "person.crop.circle.fill"
    
    var title: String {
        switch self {
        case .home: "Home"
        case .viewRoom: "View Room"
        case .setting: "Setting"
        case .profile: "Profile"
        }
    }
}

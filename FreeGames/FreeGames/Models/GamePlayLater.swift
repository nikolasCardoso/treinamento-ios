//
//  GamePlayLater.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 12/08/22.
//

import Foundation

struct GamePlayLater: Codable {
    
    let id: Int
    let title: String
    let description: String
    let image: String
    let genre: String
    let platform: PlatformPlayLater
    
}

enum PlatformPlayLater: Codable {
    
    case pc
    case webBrowser
    case unknown
    
    var iconName: String {
        switch self {
        case .pc:
            return "desktopcomputer"
        case .webBrowser:
            return "menubar.dock.rectangle"
        default:
            return ""
        }
    }
    
}

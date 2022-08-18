//
//  GamePlayLater.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 12/08/22.
//

import Foundation

struct GamePlayLater: Codable, Equatable {
    
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
    case both
    
    var iconName: String {
        switch self {
        case .pc:
            return Strings.platformPcIcon()
        case .webBrowser:
            return Strings.platformWebBrowserIcon()
        default:
            return Strings.platformBothIcon()
        }
    }
    
}

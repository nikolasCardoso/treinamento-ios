//
//  GameDetails+Mapper.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 12/08/22.
//

import Foundation

extension GameDetails {
    
    func toGamePlayLater() -> GamePlayLater {
        return GamePlayLater(id: self.id, title: self.title, description: self.description, image: self.image, genre: self.genre, platform: self.platform.toPlayLater())
    }
    
}

extension Platform {
    
    func toPlayLater() -> PlatformPlayLater {
        switch self {
        case .pc:
            return .pc
        case .webBrowser:
            return .webBrowser
        case .both:
            return .both
        }
    }
    
}

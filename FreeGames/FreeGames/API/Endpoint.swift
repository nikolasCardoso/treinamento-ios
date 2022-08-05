//
//  Endpoint.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 02/08/22.
//

import Foundation

enum Endpoint {
    case games
    case game(id: Int)
    
    var url: String {
        switch self {
        case .game(_):
            return "game"
        default:
            return "\(self)"
        }
    }
    
    var gameId: String? {
        switch self {
        case .game(let id):
            return String(id)
        default:
            return nil
        }
    }
}

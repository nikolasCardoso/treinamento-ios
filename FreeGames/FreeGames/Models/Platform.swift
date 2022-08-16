//
//  Platform.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 04/08/22.
//

import Foundation

enum Platform: Codable {
    
    case pc
    case webBrowser
    case unknown
    
    init(from decoder: Decoder) throws {
        let rawValue = try decoder.singleValueContainer().decode(String.self)
        switch rawValue {
        case "PC (Windows)", "Windows":
            self = .pc
            break
        case "Web Browser":
            self = .webBrowser
            break
        default:
            self = .unknown
            break
        }
    }
    
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
    
    var name: String {
        switch self {
        case .pc:
            return "Windows"
        case .webBrowser:
            return "Web Browser"
        default:
            return ""
        }
    }
    
}

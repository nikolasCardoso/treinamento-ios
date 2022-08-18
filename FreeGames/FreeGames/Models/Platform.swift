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
    case both
    
    init(from decoder: Decoder) throws {
        let rawValue = try decoder.singleValueContainer().decode(String.self)
        switch rawValue {
        case Strings.platformPcName(), Strings.platformPcNameVariant():
            self = .pc
            break
        case Strings.platformWebBrowserName():
            self = .webBrowser
            break
        default:
            self = .both
            break
        }
    }
    
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
    
    var name: String {
        switch self {
        case .pc:
            return Strings.platformPcName()
        case .webBrowser:
            return Strings.platformWebBrowserName()
        default:
            return Strings.platformBothName()
        }
    }
    
}

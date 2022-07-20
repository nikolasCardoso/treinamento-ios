//
//  String+Character+Comparable.swift
//  Forca
//
//  Created by Nikolas Cardoso de Oliveira on 20/07/22.
//

import Foundation

extension Character {
    
    var comparable: String {
        uppercased().folding(options: .diacriticInsensitive, locale: .current)
    }
}

extension String {
    var comparable: String {
        uppercased().folding(options: .diacriticInsensitive, locale: .current)
    }
}

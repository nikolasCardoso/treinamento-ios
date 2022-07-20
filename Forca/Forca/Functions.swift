//
//  Functions.swift
//  Forca
//
//  Created by Nikolas Cardoso de Oliveira on 20/07/22.
//

import Foundation

func swap(letter: String, on mask: String, original: String) -> String {
    let character = Character(letter)
    var result = mask
    
    for index in original.indices {
        if original[index] == character {
            result.remove(at: index)
            result.insert(character, at: index)
        }
    }
    
    return result
}

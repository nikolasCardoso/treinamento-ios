//
//  Capsule.swift
//  Nospresso
//
//  Created by Elias on 26/07/22.
//

import Foundation

struct Capsule: Codable {
    
    let category: String
    let coffees: [Coffee]
    
    enum CodingKeys: String, CodingKey {
        case category = "categoria"
        case coffees = "cafes"
    }
    
}

//
//  Accessorie.swift
//  Nespresso
//
//  Created by Nikolas Cardoso de Oliveira on 25/07/22.
//

import Foundation

struct Accessorie: Codable {
    
    let id: Int
    let name: String
    let price: Double
    let image: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case price = "preco"
        case image = "imagem"
        case description = "descricao"
    }
}

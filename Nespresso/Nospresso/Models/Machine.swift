//
//  Machine.swift
//  Nospresso
//
//  Created by Nikolas Cardoso de Oliveira on 29/07/22.
//

import Foundation

struct Machine: Codable {
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case description = "descricao"
        case price = "preco"
        case image = "imagem"
    }
    
}

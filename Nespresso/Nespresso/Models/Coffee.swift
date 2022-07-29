//
//  Coffee.swift
//  Nespresso
//
//  Created by Nikolas Cardoso de Oliveira on 22/07/22.
//

import Foundation

struct Coffee: Codable {
    
    let id: Int
    let name: String
    let description: String
    let intensity: Int?
    let image: String
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case description = "descricao"
        case image = "imagem"
        case intensity = "intensidade"
        case price = "precoUnitario"
    }
}

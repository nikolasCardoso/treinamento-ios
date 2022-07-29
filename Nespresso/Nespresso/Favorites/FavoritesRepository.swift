//
//  FavoritesRepository.swift
//  Nespresso
//
//  Created by Nikolas Cardoso de Oliveira on 22/07/22.
//

import Foundation

class FavoritesRepository {
    
    weak var output: FavoritesRepositoryOutputProtocol?
}

extension FavoritesRepository: FavoritesRepositoryInputProtocol {
    
}

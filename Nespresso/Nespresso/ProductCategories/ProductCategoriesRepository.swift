//
//  ProductCategoriesRepository.swift
//  Nespresso
//
//  Created by Nikolas Cardoso de Oliveira on 21/07/22.
//

import Foundation

class ProductCategoriesRepository {
    
    weak var output: ProductCategoriesRepositoryOutputProtocol?
}

extension ProductCategoriesRepository: ProductCategoriesRepositoryInputProtocol {
}

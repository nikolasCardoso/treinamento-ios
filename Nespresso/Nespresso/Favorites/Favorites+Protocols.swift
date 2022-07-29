//
//  Favorites+Protocols.swift
//  Nespresso
//
//  Created by Nikolas Cardoso de Oliveira on 22/07/22.
//

import Foundation


// Presenter -> Coordinator
protocol FavoritesCoordinatorProtocol {
}

// Presenter -> ViewCOntroller
protocol FavoritesViewControllerProtocol: AnyObject {
    
}

// ViewController -> Presenter
protocol FavoritesPresenterProtocol {
}
// Presenter -> Repository
protocol FavoritesRepositoryInputProtocol{
}
// Repository -> Presenter
protocol FavoritesRepositoryOutputProtocol: AnyObject {
}

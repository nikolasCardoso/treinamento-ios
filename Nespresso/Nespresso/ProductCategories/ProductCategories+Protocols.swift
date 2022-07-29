//
//  ProductCategories+Protocols.swift
//  Nespresso
//
//  Created by Nikolas Cardoso de Oliveira on 21/07/22.
//

import Foundation

// Presenter -> Coordinator
protocol ProductCategoriesCoordinatorProtocol {
    func openCoffees()
    func openMachines()
    func openAccessories()
}

// Presenter -> ViewCOntroller
protocol ProductCategoriesViewControllerProtocol: AnyObject {
    
}

// ViewController -> Presenter
protocol ProductCategoriesPresenterProtocol {
    func coffeesTouched()
    func machinesTouched()
    func accessoriesTouched()
}
// Presenter -> Repository
protocol ProductCategoriesRepositoryInputProtocol{
}
// Repository -> Presenter
protocol ProductCategoriesRepositoryOutputProtocol: AnyObject {
}

import Foundation

// Presenter -> Coordinator
internal protocol RepositoriesCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol RepositoriesViewProtocol: AnyObject {

}

// ViewController -> Presenter
internal protocol RepositoriesPresenterProtocol {

}

// Presenter -> Repository
internal protocol RepositoriesRepositoryInputProtocol {
    
}

// Repository -> Presenter
internal protocol RepositoriesRepositoryOutputProtocol: AnyObject {
    
}

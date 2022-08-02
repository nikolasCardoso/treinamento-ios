import Foundation

// Presenter -> Coordinator
internal protocol PlayLaterCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol PlayLaterViewProtocol: AnyObject {

}

// ViewController -> Presenter
internal protocol PlayLaterPresenterProtocol {

}

// Presenter -> Repository
internal protocol PlayLaterRepositoryInputProtocol {
    
}

// Repository -> Presenter
internal protocol PlayLaterRepositoryOutputProtocol: AnyObject {
    
}

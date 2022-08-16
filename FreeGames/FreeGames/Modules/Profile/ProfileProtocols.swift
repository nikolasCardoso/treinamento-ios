import Foundation

// Presenter -> Coordinator
internal protocol ProfileCoordinatorProtocol {
    func navigateToEditProfile()
}

// Presenter -> ViewController
internal protocol ProfileViewProtocol: AnyObject {
    func setup(with user: User?)
}

// ViewController -> Presenter
internal protocol ProfilePresenterProtocol {
    func viewDidLoad()
    func goToEditProfile()
}

// Presenter -> Repository
internal protocol ProfileRepositoryInputProtocol {
    func getUserInformation()
}

// Repository -> Presenter
internal protocol ProfileRepositoryOutputProtocol: AnyObject {
    func getUserInformationSuccess(with user: User?)
}

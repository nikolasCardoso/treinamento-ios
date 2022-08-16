import Foundation

// Presenter -> Coordinator
internal protocol EditProfileCoordinatorProtocol {
    func dismissViewController()
}

// Presenter -> ViewController
internal protocol EditProfileViewProtocol: AnyObject {
    func setup(with user: User)
}

// ViewController -> Presenter
internal protocol EditProfilePresenterProtocol {
    func viewDidLoad()
    func saveProfileButtonTouched(with user: [UserInformations: String?])
}

// Presenter -> Repository
internal protocol EditProfileRepositoryInputProtocol {
    func getUserInformation()
    func saveUserInformation(name: String?, email: String?, photoPath: String?)
}

// Repository -> Presenter
internal protocol EditProfileRepositoryOutputProtocol: AnyObject {
    func getUserInformationSuccess(with user: User)
}

import Foundation

internal class ProfilePresenter {

    internal weak var view: ProfileViewProtocol?
    internal var repository: ProfileRepositoryInputProtocol
    internal var coordinator: ProfileCoordinatorProtocol
    
    internal var user: User?
    
    internal init(repository: ProfileRepositoryInputProtocol,
                  coordinator: ProfileCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension ProfilePresenter: ProfilePresenterProtocol {
    
    func viewDidLoad() {
        repository.getUserInformation()
    }
    
    func goToEditProfile() {
        coordinator.navigateToEditProfile()
    }

}
// MARK: - Repository Output
extension ProfilePresenter: ProfileRepositoryOutputProtocol {
    
    func getUserInformationSuccess(with user: User?) {
        self.user = user
        view?.setup(with: user)
    }
    
}

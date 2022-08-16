import Foundation
import UIKit

internal class EditProfilePresenter {

    internal weak var view: EditProfileViewProtocol?
    internal var repository: EditProfileRepositoryInputProtocol
    internal var coordinator: EditProfileCoordinatorProtocol
    
    internal var user: User?
    
    internal init(repository: EditProfileRepositoryInputProtocol,
                  coordinator: EditProfileCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
    
}

// MARK: - Presenter Protocol
extension EditProfilePresenter: EditProfilePresenterProtocol {
    
    func saveProfileButtonTouched(with user: [UserInformations : String?]) {
        guard let name = user[.name] else { return }
        guard let email = user[.email] else { return }
        guard let photoPath = user[.photoPath] else { return }
        
        repository.saveUserInformation(name: name, email: email, photoPath: photoPath)
        coordinator.dismissViewController()
    }
    
    func viewDidLoad() {
        repository.getUserInformation()
    }

}

// MARK: - Repository Output
extension EditProfilePresenter: EditProfileRepositoryOutputProtocol {
    
    func getUserInformationSuccess(with user: User) {
        self.user = user
        view?.setup(with: user)
    }
    
}

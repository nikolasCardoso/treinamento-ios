import UIKit

internal class EditProfileCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension EditProfileCoordinator: EditProfileCoordinatorProtocol {
    
    func dismissViewController() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension EditProfileCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = EditProfileRepository()

        let coordinator = EditProfileCoordinator(navigationController: navigationController)
        
        let presenter = EditProfilePresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = EditProfileViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}

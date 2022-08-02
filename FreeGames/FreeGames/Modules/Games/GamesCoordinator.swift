import UIKit

internal class GamesCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension GamesCoordinator: GamesCoordinatorProtocol {
    
}

extension GamesCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = GamesRepository()

        let coordinator = GamesCoordinator(navigationController: navigationController)
        
        let presenter = GamesPresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = GamesViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}

import UIKit

internal class PlayLaterCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension PlayLaterCoordinator: PlayLaterCoordinatorProtocol {
    
    func navigateToGameDetails(with gameId: Int) {
        let viewController = GameDetailsCoordinator.createModule(navigationController: navigationController, with: gameId)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension PlayLaterCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = PlayLaterRepository()

        let coordinator = PlayLaterCoordinator(navigationController: navigationController)
        
        let presenter = PlayLaterPresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = PlayLaterViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}

import UIKit

internal class GameDetailsCoordinator: GameDetailsCoordinatorProtocol {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension GameDetailsCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?, with gameId: Int) -> UIViewController {
        let repository = GameDetailsRepository()

        let coordinator = GameDetailsCoordinator(navigationController: navigationController)
        
        let presenter = GameDetailsPresenter(
            repository: repository,
            gameId: gameId,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = GameDetailsViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}

import UIKit

internal class CoffeesCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension CoffeesCoordinator: CoffeesCoordinatorProtocol {
    
    func openCoffeeDetails(using coffee: Coffee) {
        let viewController = CoffeeDetailsCoordinator.createModule(navigationController: navigationController, coffee: coffee)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension CoffeesCoordinator {
    
    internal class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = CoffeesRepository()

        let coordinator = CoffeesCoordinator(navigationController: navigationController)
        
        let presenter = CoffeesPresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = CoffeesViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}

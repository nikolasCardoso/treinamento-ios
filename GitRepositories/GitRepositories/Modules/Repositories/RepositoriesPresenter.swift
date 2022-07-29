import Foundation

internal class RepositoriesPresenter {

    internal weak var view: RepositoriesViewProtocol?
    internal var repository: RepositoriesRepositoryInputProtocol
    internal var coordinator: RepositoriesCoordinatorProtocol
    
    internal init(repository: RepositoriesRepositoryInputProtocol,
                  coordinator: RepositoriesCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension RepositoriesPresenter: RepositoriesPresenterProtocol {

}
// MARK: - Repository Output
extension RepositoriesPresenter: RepositoriesRepositoryOutputProtocol {
    
}

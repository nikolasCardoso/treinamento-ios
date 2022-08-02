import Foundation

internal class PlayLaterPresenter {

    internal weak var view: PlayLaterViewProtocol?
    internal var repository: PlayLaterRepositoryInputProtocol
    internal var coordinator: PlayLaterCoordinatorProtocol
    
    internal init(repository: PlayLaterRepositoryInputProtocol,
                  coordinator: PlayLaterCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension PlayLaterPresenter: PlayLaterPresenterProtocol {

}
// MARK: - Repository Output
extension PlayLaterPresenter: PlayLaterRepositoryOutputProtocol {
    
}

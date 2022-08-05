import Foundation

internal class GameDetailsPresenter {

    internal weak var view: GameDetailsViewProtocol?
    internal var repository: GameDetailsRepositoryInputProtocol
    internal var coordinator: GameDetailsCoordinatorProtocol
    
    internal var gameId: Int
    internal var game: GameDetails?
    
    internal init(repository: GameDetailsRepositoryInputProtocol,
                  gameId: Int,
                  coordinator: GameDetailsCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
        self.gameId = gameId
    }
}

// MARK: - Presenter Protocol
extension GameDetailsPresenter: GameDetailsPresenterProtocol {
    
    func viewDidLoad() {
        repository.getGameDetails(with: gameId)
    }

}

// MARK: - Repository Output
extension GameDetailsPresenter: GameDetailsRepositoryOutputProtocol {
    
    func getGameDetailsSuccess(with game: GameDetails) {
        self.game = game
        
        DispatchQueue.main.async {
            self.view?.setup(with: game)
        }
    }
    
    func getGameDetailsFailure(with error: APIError) {
        print(error)
    }
    
}


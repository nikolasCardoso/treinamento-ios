import Foundation

internal class GameDetailsPresenter {

    internal weak var view: GameDetailsViewProtocol?
    internal var repository: GameDetailsRepositoryInputProtocol
    internal var coordinator: GameDetailsCoordinatorProtocol
    
    internal var gameId: Int
    internal var game: GameDetails?
    internal var isGameInPlayLater: Bool = false
    
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
    
    func viewWillAppear() {
        view?.changePlayLaterButton(isInPlayLater: PlayLaterStorage.shared.isInPlayLater(id: gameId))
    }
    
    func addGameToPlayLater() {
        if let gameNotNull = game {
            let isInPlayLater = PlayLaterStorage.shared.setPlayLater(game: gameNotNull)
            view?.changePlayLaterButton(isInPlayLater: isInPlayLater)
        }
    }
    
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


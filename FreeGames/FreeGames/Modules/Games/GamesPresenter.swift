import Foundation

internal class GamesPresenter {

    internal weak var view: GamesViewProtocol?
    internal var repository: GamesRepositoryInputProtocol
    internal var coordinator: GamesCoordinatorProtocol
    
    private var games: [Game] = []
    
    internal init(repository: GamesRepositoryInputProtocol,
                  coordinator: GamesCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension GamesPresenter: GamesPresenterProtocol {
    
    func viewDidLoad() {
        repository.getGames()
    }

}
// MARK: - Repository Output
extension GamesPresenter: GamesRepositoryOutputProtocol {
    
    func getGamesSuccess(with games: [Game]) {
        self.games = games
        
        DispatchQueue.main.async {
            print("foi")
        }
    }
    
    func getGamesFailure(with error: APIError) {
        DispatchQueue.main.async {
            print("n foi :(")
        }
    }
    
}

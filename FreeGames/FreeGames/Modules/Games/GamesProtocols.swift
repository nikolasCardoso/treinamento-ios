import Foundation

// Presenter -> Coordinator
internal protocol GamesCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol GamesViewProtocol: AnyObject {

}

// ViewController -> Presenter
internal protocol GamesPresenterProtocol {
    func viewDidLoad()
}

// Presenter -> Repository
internal protocol GamesRepositoryInputProtocol {
    func getGames()
}

// Repository -> Presenter
internal protocol GamesRepositoryOutputProtocol: AnyObject {
    func getGamesSuccess(with games: [Game])
    func getGamesFailure(with error: APIError)
}

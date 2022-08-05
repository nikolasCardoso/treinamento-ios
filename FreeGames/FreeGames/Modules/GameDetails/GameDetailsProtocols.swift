import Foundation

// Presenter -> Coordinator
internal protocol GameDetailsCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol GameDetailsViewProtocol: AnyObject {
    func setup(with game: GameDetails)
}

// ViewController -> Presenter
internal protocol GameDetailsPresenterProtocol {
    func viewDidLoad()
}

// Presenter -> Repository
internal protocol GameDetailsRepositoryInputProtocol {
    func getGameDetails(with id: Int)
}

// Repository -> Presenter
internal protocol GameDetailsRepositoryOutputProtocol: AnyObject {
    func getGameDetailsSuccess(with game: GameDetails)
    func getGameDetailsFailure(with error: APIError)
}

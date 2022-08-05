import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol GamesCoordinatorProtocol {
    func navigateToGameDetails(with gameId: Int)
}

// Presenter -> ViewController
internal protocol GamesViewProtocol: AnyObject {
    func reload()
}

// ViewController -> Presenter
internal protocol GamesPresenterProtocol: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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

import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol PlayLaterCoordinatorProtocol {
    func navigateToGameDetails(with gameId: Int)
}

// Presenter -> ViewController
internal protocol PlayLaterViewProtocol: AnyObject {
    func reload()
}

// ViewController -> Presenter
internal protocol PlayLaterPresenterProtocol: UITableViewDelegate, UITableViewDataSource {
    func viewWillAppear()
}

// Presenter -> Repository
internal protocol PlayLaterRepositoryInputProtocol {
    func getPlayLaterGames()
}

// Repository -> Presenter
internal protocol PlayLaterRepositoryOutputProtocol: AnyObject {
    func getPlayLaterGamesSuccess(with games: [GameDetails])
}

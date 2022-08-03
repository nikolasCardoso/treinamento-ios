import Foundation
import UIKit

internal class GamesPresenter: NSObject {

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
        view?.reload()
    }
    
    func getGamesFailure(with error: APIError) {
        DispatchQueue.main.async {
            print("n foi :(")
        }
    }
    
}

extension GamesPresenter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GamesViewCell.reuseIdentifier, for: indexPath)!
        cell.setup(with: games[indexPath.row])
        return cell
    }
}

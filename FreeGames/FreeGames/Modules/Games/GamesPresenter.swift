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

extension GamesPresenter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: (collectionView.frame.width - 8) / 2, height: 131)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let game = games[indexPath.row]
        
        coordinator.navigateToGameDetails(with: game.id)
    }
}

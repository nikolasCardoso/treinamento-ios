import Foundation
import UIKit

internal class PlayLaterPresenter: NSObject {

    internal weak var view: PlayLaterViewProtocol?
    internal var repository: PlayLaterRepositoryInputProtocol
    internal var coordinator: PlayLaterCoordinatorProtocol
    
    internal var games: [GamePlayLater] = []
    internal var filteredGames: [GamePlayLater] = []
    
    internal init(repository: PlayLaterRepositoryInputProtocol,
                  coordinator: PlayLaterCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension PlayLaterPresenter: PlayLaterPresenterProtocol {
    
    func viewWillAppear() {
        repository.getPlayLaterGames()
    }

}

// MARK: - Repository Output
extension PlayLaterPresenter: PlayLaterRepositoryOutputProtocol {
    
    func removedGameSuccess(with games: [GamePlayLater]) {
        self.games = games
        view?.reload()
    }
    
    func getPlayLaterGamesSuccess(with games: [GamePlayLater]) {
        self.games = games
        filteredGames = games
        view?.reload()
    }
    
}

extension PlayLaterPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayLaterViewCell.reuseIdentifier, for: indexPath)!
        let game = filteredGames[indexPath.row]
        
        cell.delegate = self
        cell.setup(with: game)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gameId = filteredGames[indexPath.row].id
        coordinator.navigateToGameDetails(with: gameId)
    }
    
}

extension PlayLaterPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredGames.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        118
    }
    
}

extension PlayLaterPresenter: PlayLaterViewCellDelegate {
    
    func didRemoveButtonTouched(with game: GamePlayLater) {
        repository.removeGame(with: game)
        
        if let index = filteredGames.firstIndex(where: {$0.id == game.id}) {
            filteredGames.remove(at: index)
        }
    }
    
}

extension PlayLaterPresenter: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredGames = games
        } else {
            filteredGames = games.filter { game in
                game.title.uppercased().contains(searchText.uppercased())
            }
        }
        view?.reload()
    }
    
}

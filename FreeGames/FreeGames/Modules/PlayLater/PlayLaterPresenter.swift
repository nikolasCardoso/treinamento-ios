import Foundation
import UIKit

internal class PlayLaterPresenter: NSObject {

    internal weak var view: PlayLaterViewProtocol?
    internal var repository: PlayLaterRepositoryInputProtocol
    internal var coordinator: PlayLaterCoordinatorProtocol
    
    internal var games: [GameDetails] = []
    
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
    
    func getPlayLaterGamesSuccess(with games: [GameDetails]) {
        self.games = games
        view?.reload()
    }
    
}

extension PlayLaterPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayLaterViewCell.reuseIdentifier, for: indexPath)!
        let game = games[indexPath.row]
        
        cell.setup(with: game)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gameId = games[indexPath.row].id
        coordinator.navigateToGameDetails(with: gameId)
    }
    
}

extension PlayLaterPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        118
    }
    
}

extension PlayLaterPresenter: PlayLaterViewCellDelegate {
    
    func didRemoveButtonTouched(with game: GameDetails) {
        //TODO: LEVAR ISSO PRO REPOSITORIO E ATUALIZAR TELA QUANDO REMOVER
        PlayLaterStorage.shared.remove(game: game)
        view?.reload()
    }
    
}

import Foundation

internal class GameDetailsRepository {

    internal weak var output: GameDetailsRepositoryOutputProtocol?
    let api = API()

}

// MARK: - Repository Input
extension GameDetailsRepository: GameDetailsRepositoryInputProtocol {
    
    func getGameDetails(with id: Int) {
        api.request(endpoint: .game(id: id)) { [weak self] (game: GameDetails) in
            self?.output?.getGameDetailsSuccess(with: game)
        } failure: { [weak self] error in
            self?.output?.getGameDetailsFailure(with: error)
        }
    }
    
}

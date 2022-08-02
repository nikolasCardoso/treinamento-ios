import Foundation

internal class GamesRepository {

    internal weak var output: GamesRepositoryOutputProtocol?
    let api = API()

}

// MARK: - Repository Input
extension GamesRepository: GamesRepositoryInputProtocol {
    
    func getGames() {
        api.request(endpoint: .games) { [weak self] (games: [Game]) in
            self?.output?.getGamesSuccess(with: games)
        } failure: { [weak self] error in
            self?.output?.getGamesFailure(with: error)
        }
    }
    
}

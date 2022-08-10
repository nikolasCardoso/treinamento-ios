import Foundation

internal class PlayLaterRepository {

    internal weak var output: PlayLaterRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension PlayLaterRepository: PlayLaterRepositoryInputProtocol {
    
    func getPlayLaterGames() {
        let games = PlayLaterStorage.shared.games
        output?.getPlayLaterGamesSuccess(with: games)
    }

}

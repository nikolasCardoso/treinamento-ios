import Foundation

internal class PlayLaterRepository {

    internal weak var output: PlayLaterRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension PlayLaterRepository: PlayLaterRepositoryInputProtocol {
    
    func removeGame(with game: GamePlayLater) {
        PlayLaterStorage.shared.remove(game: game)
        output?.removedGameSuccess(with: PlayLaterStorage.shared.games)
    }
    
    
    func getPlayLaterGames() {
        let games = PlayLaterStorage.shared.games
        output?.getPlayLaterGamesSuccess(with: games)
    }

}

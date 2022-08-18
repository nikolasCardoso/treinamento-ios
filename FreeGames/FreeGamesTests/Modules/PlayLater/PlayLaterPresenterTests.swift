//
//  PlayLaterPresenterTests.swift
//  FreeGamesTests
//
//  Created by Nikolas Cardoso de Oliveira on 18/08/22.
//

import XCTest
@testable import FreeGames

class PlayLaterPresenterTests: XCTestCase {
    
    var presenter: PlayLaterPresenter!
    var view = PlayLaterMockView()
    var repository = PlayLaterMockRepository()
    var coordinator = PlayLaterMockCoordinator()
    
    override func setUp() async throws {
        presenter = PlayLaterPresenter(repository: self.repository, coordinator: self.coordinator)
        presenter.view = self.view
    }
    
    func test_whenViewAppear_shouldCallForPlayLaterGamesFromRepositorySuccessfully() throws {
        presenter.viewWillAppear()
        
        XCTAssertTrue(repository.isGetPlayLaterGamesCalled)
    }
    
    func test_withGamesFromPlayLater_whenGetGamesFromPlayLaterSuccess_shouldSaveGamesAndCallViewSuccessfully() throws {
        let games = [
            GamePlayLater(id: 1, title: "Test", description: "A test", image: "test", genre: "test", platform: .pc),
            GamePlayLater(id: 2, title: "Test2", description: "A test2", image: "test2", genre: "test2", platform: .both)
        ]
        
        presenter.getPlayLaterGamesSuccess(with: games)
        
        XCTAssertTrue(view.isReloadCalled)
        XCTAssertEqual(presenter.games[0], games[0])
        XCTAssertEqual(presenter.games[1], games[1])
        XCTAssertEqual(presenter.filteredGames[0], games[0])
        XCTAssertEqual(presenter.filteredGames[1], games[1])
    }
    
    func test_withGamesFromPlayLater_whenRemovedGamesFromPlayLaterSuccess_shouldSaveGamesAndCallViewSuccessfully() throws {
        let games = [
            GamePlayLater(id: 1, title: "Test", description: "A test", image: "test", genre: "test", platform: .pc),
            GamePlayLater(id: 2, title: "Test2", description: "A test2", image: "test2", genre: "test2", platform: .both)
        ]
        
        presenter.removedGameSuccess(with: games)
        
        XCTAssertTrue(view.isReloadCalled)
        XCTAssertEqual(presenter.games[0], games[0])
        XCTAssertEqual(presenter.games[1], games[1])
    }
    
    func test_whenGameRemoved_shouldRemoveGameFromFilteredGamesSuccessfully() throws {
        let game1 = GamePlayLater(id: 1, title: "Test", description: "A test", image: "test", genre: "test", platform: .pc)
        let games = [
            game1,
            GamePlayLater(id: 2, title: "Test2", description: "A test2", image: "test2", genre: "test2", platform: .both)
        ]
        presenter.filteredGames = games
        
        presenter.didRemoveButtonTouched(with: game1)
        
        XCTAssertTrue(repository.isRemoveGameCalled)
        XCTAssertEqual(presenter.filteredGames.count, 1)
        XCTAssertEqual(presenter.filteredGames[0], games[1])
    }
    
}

class PlayLaterMockView: PlayLaterViewProtocol {
    
    var isReloadCalled = false
    func reload() {
        isReloadCalled = true
    }
    
}

class PlayLaterMockRepository: PlayLaterRepositoryInputProtocol {
    
    var isGetPlayLaterGamesCalled = false
    func getPlayLaterGames() {
        isGetPlayLaterGamesCalled = true
    }
    
    var isRemoveGameCalled = false
    func removeGame(with game: GamePlayLater) {
        isRemoveGameCalled = true
    }
    
}

class PlayLaterMockCoordinator: PlayLaterCoordinatorProtocol {
    
    var isNavigateToGameDetailsCalled = false
    func navigateToGameDetails(with gameId: Int) {
        isNavigateToGameDetailsCalled = true
    }
    
}

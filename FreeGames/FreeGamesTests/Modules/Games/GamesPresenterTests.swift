//
//  GamesPresenterTests.swift
//  FreeGamesTests
//
//  Created by Nikolas Cardoso de Oliveira on 18/08/22.
//

import XCTest
@testable import FreeGames

class GamesPresenterTests: XCTestCase {
    
    var presenter: GamesPresenter!
    var view = GamesMockView()
    var repository = GamesMockRepository()
    var coordinator = GamesMockCoordinator()
    
    override func setUp() async throws {
        presenter = GamesPresenter(repository: self.repository, coordinator: self.coordinator)
        presenter.view = self.view
    }
    
    func test_whenViewLoad_shouldCallViewLoadingAndRepositoryGetGamesSuccessfully() throws {
        presenter.viewDidLoad()
        XCTAssertTrue(view.isShowLoadingIndicatorCalled)
        XCTAssertTrue(repository.isGetGamesCalled)
    }
    
    func test_withGames_whenGetGamesSuccess_shouldSaveGamesAndCallViewSuccessfully() throws {
        let games = [
            Game(id: 1, title: "Test", description: "des Test", image: "image test", genre: "genre test", platform: .pc),
            Game(id: 2, title: "Test2", description: "des Test2", image: "image test2", genre: "genre test2", platform: .webBrowser)
        ]
        
        presenter.getGamesSuccess(with: games)

        XCTAssertTrue(view.isReloadCalled)
        XCTAssertTrue(view.isHideLoadingIndicatorCalled)
        XCTAssertEqual(presenter.games[0], games[0])
        XCTAssertEqual(presenter.games[1], games[1])
    }
    
    func test_withApiError_whenGetGamesFailure_shouldShowAlertAndHideLoadingSuccessfully() throws {
        presenter.getGamesFailure(with: .invalidData)
        
        DispatchQueue.main.async {
            XCTAssertTrue(self.view.isShowAlertCalled)
            XCTAssertTrue(self.view.isHideLoadingIndicatorCalled)
        }
    }
    
}

class GamesMockView: GamesViewProtocol {
    
    var isReloadCalled = false
    func reload() {
        isReloadCalled = true
    }
    
    var isShowAlertCalled = false
    func showAlert(title: String, message: String) {
        isShowAlertCalled = true
    }
    
    var isShowLoadingIndicatorCalled = false
    func showLoadingIndicator() {
        isShowLoadingIndicatorCalled = true
    }
    
    var isHideLoadingIndicatorCalled = false
    func hideLoadingIndicator() {
        isHideLoadingIndicatorCalled = true
    }
    
}

class GamesMockRepository: GamesRepositoryInputProtocol {
    
    var isGetGamesCalled = false
    func getGames() {
        isGetGamesCalled = true
    }
    
}

class GamesMockCoordinator: GamesCoordinatorProtocol {
    
    var isNavigateToGameDetailsCalled = false
    func navigateToGameDetails(with gameId: Int) {
        isNavigateToGameDetailsCalled = true
    }
    
}

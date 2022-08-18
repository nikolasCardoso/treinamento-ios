//
//  GameDetailsPresenterTests.swift
//  FreeGamesTests
//
//  Created by Nikolas Cardoso de Oliveira on 18/08/22.
//

import XCTest
@testable import FreeGames

class GameDetailsPresenterTests: XCTestCase {
    
    var presenter: GameDetailsPresenter!
    var view = GameDetailsMockView()
    var repository = GameDetailsMockRepository()
    var coordinator = GameDetailsMockCoordinator()
    var gameId: Int = 1
    
    override func setUp() async throws {
        presenter = GameDetailsPresenter(repository: self.repository, gameId: self.gameId, coordinator: self.coordinator)
        presenter.view = self.view
    }
    
    func test_whenViewWillAppear_shouldCallForChangeButtonInViewSuccessfully() throws {
        presenter.viewWillAppear()
        
        XCTAssertTrue(view.isChangePlayLaterButtonCalled)
    }
    
    func test_withGameNull_whenAddGameToPlayLater_shouldNotCallForChangeButtonInView() throws {
        presenter.addGameToPlayLater()
        
        XCTAssertFalse(view.isChangePlayLaterButtonCalled)
    }
    
    func test_withGame_whenAddGameToPlayLater_shouldCallForChangeButtonInViewSuccessfully() throws {
        let game = GameDetails(id: 1, title: "Test", description: "A test", image: "test", url: "teste.com", genre: "test", platform: .pc, developer: "test", publisher: "test", releaseDate: "test", minSysReq: nil)
        
        presenter.game = game
        presenter.addGameToPlayLater()
        
        XCTAssertTrue(view.isChangePlayLaterButtonCalled)
    }
    
    func test_whenViewLoad_shouldCallViewLoadingAndRepositoryGetGameDetailsSuccessfully() throws {
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.isShowLoadingIndicatorCalled)
        XCTAssertTrue(repository.isGetGameDetailsCalled)
    }
    
    func test_withGameDetails_whenGetGameDetailsSuccess_shouldSaveGameAndCallViewSuccessfully() throws {
        let game = GameDetails(id: 1, title: "Test", description: "A test", image: "test", url: "teste.com", genre: "test", platform: .pc, developer: "test", publisher: "test", releaseDate: "test", minSysReq: nil)
        
        presenter.getGameDetailsSuccess(with: game)
        
        DispatchQueue.main.async {
            XCTAssertTrue(self.view.isSetupCalled)
        }
        XCTAssertTrue(view.isHideLoadingIndicatorCalled)
        XCTAssertEqual(presenter.game, game)
    }
    
    func test_withApiError_whenGetGameDetailsFailure_shouldShowAlertAndHideLoadingSuccessfully() throws {
        presenter.getGameDetailsFailure(with: .invalidData)
        
        DispatchQueue.main.async {
            XCTAssertTrue(self.view.isShowAlertCalled)
            XCTAssertTrue(self.view.isHideLoadingIndicatorCalled)
        }
    }
    
}

class GameDetailsMockView: GameDetailsViewProtocol {
    
    var isSetupCalled = false
    func setup(with game: GameDetails) {
        isSetupCalled = true
    }
    
    var isShowAlertCalled = false
    func showAlert(title: String, message: String) {
        isShowAlertCalled = true
    }
    
    var isChangePlayLaterButtonCalled = false
    func changePlayLaterButton(isInPlayLater: Bool) {
        isChangePlayLaterButtonCalled = true
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

class GameDetailsMockRepository: GameDetailsRepositoryInputProtocol {
    
    var isGetGameDetailsCalled = false
    func getGameDetails(with id: Int) {
        isGetGameDetailsCalled = true
    }
    
}

class GameDetailsMockCoordinator: GameDetailsCoordinatorProtocol {
    
}

//
//  ProfilePresenterTests.swift
//  FreeGamesTests
//
//  Created by Nikolas Cardoso de Oliveira on 18/08/22.
//

import XCTest
@testable import FreeGames

class ProfilePresenterTests: XCTestCase {
    
    var presenter: ProfilePresenter!
    var view = ProfileMockView()
    var repository = ProfileMockRepository()
    var coordinator = ProfileMockCoordinator()
    
    override func setUp() async throws {
        presenter = ProfilePresenter(repository: self.repository, coordinator: self.coordinator)
        presenter.view = self.view
    }
    
    func test_whenViewLoad_shouldCallRepositorySuccessfully() throws {
        presenter.viewDidLoad()
        
        XCTAssertTrue(repository.isGetUserInformationCalled)
    }
    
    func test_whenEditProfileCalled_shouldCallCoordinatorSuccessfully() throws {
        presenter.goToEditProfile()
        
        XCTAssertTrue(coordinator.isNavigateToEditProfileCalled)
    }
    
    func test_withUser_whenGettingUserSuccess_shouldCallRepositoryAndSaveUserInternallySuccessfully() throws {
        let user = User(name: "Test", email: "test@test.com", photoPath: "path")
        
        presenter.getUserInformationSuccess(with: user)
        
        XCTAssertTrue(view.isSetupCalled)
        XCTAssertEqual(presenter.user, user)
    }
    
}

class ProfileMockView: ProfileViewProtocol {
    
    var isSetupCalled = false
    func setup(with user: User?) {
        isSetupCalled = true
    }
    
}

class ProfileMockRepository: ProfileRepositoryInputProtocol {
    
    var isGetUserInformationCalled = false
    func getUserInformation() {
        isGetUserInformationCalled = true
    }
    
}

class ProfileMockCoordinator: ProfileCoordinatorProtocol {
    
    var isNavigateToEditProfileCalled = false
    func navigateToEditProfile() {
        isNavigateToEditProfileCalled = true
    }

}

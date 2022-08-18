//
//  EditProfilePresenter.swift
//  FreeGamesTests
//
//  Created by Nikolas Cardoso de Oliveira on 18/08/22.
//

import XCTest
@testable import FreeGames

class EditProfilePresenterTests: XCTestCase {
    
    var presenter: EditProfilePresenter!
    var view = EditProfileMockView()
    var repository = EditProfileMockRepository()
    var coordinator = EditProfileMockCoordinator()
    
    override func setUp() async throws {
        presenter = EditProfilePresenter(repository: self.repository, coordinator: self.coordinator)
        presenter.view = self.view
    }

    func test_withUserInformation_whenSavingProfile_shouldSaveSuccessfully() throws {
        let userInformations: [UserInformations:String?] = [.name : "Test", .email : "test@test.com", .photoPath : "path"]
        
        presenter.saveProfileButtonTouched(with: userInformations)
        
        XCTAssertTrue(repository.isSaveUserInformationCalled)
        XCTAssertTrue(coordinator.isDismissViewControllerCalled)
    }
    
    func test_whenViewLoad_shouldCallRepositorySuccessfully() throws {
        presenter.viewDidLoad()
        
        XCTAssertTrue(repository.isGetUserInformationCalled)
    }
    
    func test_withUser_whenGettingUserSuccess_shouldCallRepositoryAndSaveUserInternallySuccessfully() throws {
        let user = User(name: "Test", email: "test@test.com", photoPath: "path")
        
        presenter.getUserInformationSuccess(with: user)
        
        XCTAssertTrue(view.isSetupCalled)
        XCTAssertEqual(presenter.user?.name, user.name)
        XCTAssertEqual(presenter.user?.email, user.email)
        XCTAssertEqual(presenter.user?.photoPath, user.photoPath)
    }

}

class EditProfileMockView: EditProfileViewProtocol {
    
    var isSetupCalled = false
    func setup(with user: User) {
        isSetupCalled = true
    }
    
}

class EditProfileMockRepository: EditProfileRepositoryInputProtocol {
    
    var isGetUserInformationCalled = false
    func getUserInformation() {
        isGetUserInformationCalled = true
    }
    
    var isSaveUserInformationCalled = false
    func saveUserInformation(name: String?, email: String?, photoPath: String?) {
        isSaveUserInformationCalled = true
    }
    
}

class EditProfileMockCoordinator: EditProfileCoordinatorProtocol {
    
    var isDismissViewControllerCalled = false
    func dismissViewController() {
        isDismissViewControllerCalled = true
    }
    
}

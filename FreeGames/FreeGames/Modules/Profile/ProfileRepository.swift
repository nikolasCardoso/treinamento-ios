import Foundation

internal class ProfileRepository {

    internal weak var output: ProfileRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension ProfileRepository: ProfileRepositoryInputProtocol {
    
    func getUserInformation() {
        let user = UserInformationDatabase.shared.user
        output?.getUserInformationSuccess(with: user)
    }

}

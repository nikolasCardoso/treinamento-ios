import Foundation

internal class EditProfileRepository {

    internal weak var output: EditProfileRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension EditProfileRepository: EditProfileRepositoryInputProtocol {
    
    func getUserInformation() {
        guard let user = UserInformationDatabase.shared.user else { return }
        output?.getUserInformationSuccess(with: user)
    }
    
    func saveUserInformation(name: String?, email: String?, photoPath: String?) {
        UserInformationDatabase.shared.createOrUpdateUser(name: name, email: email, photoPath: photoPath)
    }
    
}

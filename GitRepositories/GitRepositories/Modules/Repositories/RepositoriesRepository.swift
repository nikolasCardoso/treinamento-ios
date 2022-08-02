import Foundation

internal class RepositoriesRepository {

    internal weak var output: RepositoriesRepositoryOutputProtocol?

}

// MARK: - Repository Input
extension RepositoriesRepository: RepositoriesRepositoryInputProtocol {
    
    func getRepositories(language: String) {
        Requester.request(search: .init(endpoint: .search(language: language))) { [weak self] (result: Result<RepositoryData, APIError>) in
            switch result {
            case .success(let repositoryData):
                self?.output?.getRepositoriesSuccess(with: repositoryData.repositories)
            case .failure(let error):
                self?.output?.getRepositoriesFailure(with: error)
            }
        }
    }

}

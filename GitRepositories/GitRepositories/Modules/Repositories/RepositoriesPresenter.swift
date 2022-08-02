import Foundation
import UIKit

internal class RepositoriesPresenter: NSObject {

    internal weak var view: RepositoriesViewProtocol?
    internal var repository: RepositoriesRepositoryInputProtocol
    internal var coordinator: RepositoriesCoordinatorProtocol
    
    private var repositories: [Repository] = []
    
    internal init(repository: RepositoriesRepositoryInputProtocol,
                  coordinator: RepositoriesCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension RepositoriesPresenter: RepositoriesPresenterProtocol {
    func viewDidLoad(language: String) {
        repository.getRepositories(language: language)
    }
    
    
}
// MARK: - Repository Output
extension RepositoriesPresenter: RepositoriesRepositoryOutputProtocol {
    func getRepositoriesSuccess(with repositories: [Repository]) {
        print(repositories)
        self.repositories = repositories
        
        DispatchQueue.main.async {
            self.view?.reload()
        }
    }
    
    func getRepositoriesFailure(with error: APIError) {
        print(error)
    }
    
}

extension RepositoriesPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}

extension RepositoriesPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoriesTableViewCell.reuseIdentifier, for: indexPath)!
        
        let repository = repositories[indexPath.row]
        
        cell.setup(with: repository)
        return cell
    }
    
    
}

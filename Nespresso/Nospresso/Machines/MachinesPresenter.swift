import Foundation

internal class MachinesPresenter {

    internal weak var view: MachinesViewProtocol?
    internal var repository: MachinesRepositoryInputProtocol
    internal var coordinator: MachinesCoordinatorProtocol
    
    internal init(repository: MachinesRepositoryInputProtocol,
                  coordinator: MachinesCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
}

// MARK: - Presenter Protocol
extension MachinesPresenter: MachinesPresenterProtocol {
    func viewDidLoad() {
        <#code#>
    }
    

}
// MARK: - Repository Output
extension MachinesPresenter: MachinesRepositoryOutputProtocol {
    func getMachinesFailure(with error: APIError) {
        <#code#>
    }
    
    
}

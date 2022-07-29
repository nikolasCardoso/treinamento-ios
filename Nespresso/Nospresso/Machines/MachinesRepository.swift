import Foundation

internal class MachinesRepository {

    internal weak var output: MachinesRepositoryOutputProtocol?
    let api = API()
    
}

// MARK: - Repository Input
extension MachinesRepository: MachinesRepositoryInputProtocol {
    func getMachines() {
        api.request(endpoint: .machines) { [weak self] (machines: [Machine]) in
            
        } failure: { [weak self] error in
            <#code#>
        }
    }
    

}

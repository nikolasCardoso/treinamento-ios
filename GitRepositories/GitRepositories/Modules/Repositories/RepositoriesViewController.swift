import UIKit

internal class RepositoriesViewController: UIViewController {

    private let presenter: RepositoriesPresenterProtocol

    internal init(presenter: RepositoriesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }

}

// MARK: - RepositoriesViewControllerProtocol
extension RepositoriesViewController: RepositoriesViewProtocol {

}

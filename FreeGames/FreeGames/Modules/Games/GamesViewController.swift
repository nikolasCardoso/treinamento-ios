import UIKit

internal class GamesViewController: UIViewController {

    private let presenter: GamesPresenterProtocol

    internal init(presenter: GamesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        view.backgroundColor = .blue
    }
}

// MARK: - GamesViewControllerProtocol
extension GamesViewController: GamesViewProtocol {

}

import UIKit

internal class PlayLaterViewController: UIViewController {

    private let presenter: PlayLaterPresenterProtocol

    internal init(presenter: PlayLaterPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .red
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - PlayLaterViewControllerProtocol
extension PlayLaterViewController: PlayLaterViewProtocol {

}

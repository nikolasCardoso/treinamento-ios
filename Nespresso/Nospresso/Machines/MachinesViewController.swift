import UIKit

internal class MachinesViewController: UIViewController {

    private let presenter: MachinesPresenterProtocol
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        return view
    }()

    internal init(presenter: MachinesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - MachinesViewControllerProtocol
extension MachinesViewController: MachinesViewProtocol {

}

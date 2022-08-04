import UIKit
import SnapKit

internal class GamesViewController: UIViewController {

    private let presenter: GamesPresenterProtocol
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.gamesTitle()
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

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
        
        configViews()
        buildViews()
        buildConstraints()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

// MARK: - Views setup
extension GamesViewController {
    
    func configViews() {
        view.backgroundColor = Colors.background()
        collectionView.backgroundColor = Colors.background()
        
        collectionView.delegate = self
        collectionView.dataSource = presenter
        collectionView.register(GamesViewCell.self, forCellWithReuseIdentifier: GamesViewCell.reuseIdentifier.identifier)
        
    }
    
    func buildViews() {
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
    }
    
    func buildConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
    }
    
}

// MARK: - GamesViewControllerProtocol
extension GamesViewController: GamesViewProtocol {
    
    func reload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension GamesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: (collectionView.frame.width - 8) / 2, height: 131)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
}

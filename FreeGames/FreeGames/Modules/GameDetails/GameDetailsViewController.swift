import UIKit

internal class GameDetailsViewController: UIViewController {

    private let presenter: GameDetailsPresenterProtocol
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        
        return containerView
    }()

    internal init(presenter: GameDetailsPresenterProtocol) {
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
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}

extension GameDetailsViewController {
    
    func configViews() {
        view.backgroundColor = Colors.background()
        containerView.backgroundColor = .red
    }

    func buildViews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(containerView)
        
        containerView.addSubview(imageView)
    }

    func buildConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().inset(14)
            make.width.top.bottom.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(187)
            make.width.equalToSuperview()
        }
    }
    
}

// MARK: - GameDetailsViewControllerProtocol
extension GameDetailsViewController: GameDetailsViewProtocol {
    
    func setup(with game: GameDetails) {
        title = game.title
        imageView.loadImage(from: game.image)
        print(game)
    }

}

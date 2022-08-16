import UIKit

internal class GameDetailsViewController: UIViewController, LoadingIIndicatorViewType {
    
    var loadingIndicatorViewController: LoadingIndicatorViewController?
    
    private let presenter: GameDetailsPresenterProtocol
    
    private var gameUrl: String?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        return containerView
    }()
    
    private lazy var playNowButton: UIButton = {
        var buttonConfig = UIButton.Configuration.borderless()
        buttonConfig.image = UIImage(systemName: Strings.playLaterPlayNowIcon())
        buttonConfig.imagePlacement = .trailing
        buttonConfig.imagePadding = 5
        
        let button = UIButton(configuration: buttonConfig)
        button.setTitle(Strings.playLaterPlayNowButton(), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.tintColor = .white
        button.backgroundColor = Colors.playButton()
        button.addTarget(self, action: #selector(navigateToUrl), for: .touchDown)
        return button
    }()
    
    private lazy var playLaterButton: UIButton = {
        var buttonConfig = UIButton.Configuration.borderless()
        buttonConfig.image = UIImage(systemName: Strings.playLaterIcon())
        
        let button = UIButton(configuration: buttonConfig)
        button.tintColor = .white
        button.backgroundColor = Colors.navigationBar()
        button.addTarget(self, action: #selector(setPlayLater), for: .touchDown)
        return button
    }()
    
    private lazy var infoTitleView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 1
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = Colors.subInformation()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var additionalInfoView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 1
        return view
    }()
    
    private lazy var additionalInfoLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.playLaterAdditionalInfoTitle()
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var additionalInfoTopStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .top
        return stackView
    }()
    
    private lazy var additionalInfoBottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .top
        return stackView
    }()
    
    private lazy var developerView: InformationView = {
        let view = InformationView()
        return view
    }()
    
    private lazy var publisherView: InformationView = {
        let view = InformationView()
        return view
    }()
    
    private lazy var platformView: InformationView = {
        let view = InformationView()
        return view
    }()
    
    private lazy var releaseDateView: InformationView = {
        let view = InformationView()
        return view
    }()
    
    private lazy var genreView: InformationView = {
        let view = InformationView()
        return view
    }()
    
    private lazy var minSysReqView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 1
        view.isHidden = true
        return view
    }()
    
    private lazy var minSysReqStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private lazy var minSysReqStorageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var minSysReqLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.playLaterMinSysReqTitle()
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var osView: InformationView = {
        let view = InformationView()
        return view
    }()
    
    private lazy var processorView: InformationView = {
        let view = InformationView()
        return view
    }()
    
    private lazy var storageView: InformationView = {
        let view = InformationView()
        return view
    }()
    
    private lazy var memoryView: InformationView = {
        let view = InformationView()
        return view
    }()
    
    private lazy var graphicsView: InformationView = {
        let view = InformationView()
        return view
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
        
        presenter.viewWillAppear()
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc private func navigateToUrl() {
        guard let urlString = gameUrl else { return }
        
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func setPlayLater() {
        presenter.addGameToPlayLater()
    }
    
}

// MARK: - Views configuration
extension GameDetailsViewController {
    
    func configViews() {
        view.backgroundColor = Colors.background()
        infoTitleView.backgroundColor = .white
        additionalInfoView.backgroundColor = .white
        minSysReqView.backgroundColor = .white
    }

    func buildViews() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(containerView)
        
        containerView.addSubview(imageView)
        containerView.addSubview(playNowButton)
        containerView.addSubview(playLaterButton)
        containerView.addSubview(infoTitleView)
        containerView.addSubview(additionalInfoView)
        containerView.addSubview(minSysReqView)
        
        infoTitleView.addSubview(titleLabel)
        infoTitleView.addSubview(descriptionLabel)
        
        additionalInfoView.addSubview(additionalInfoLabel)
        additionalInfoView.addSubview(additionalInfoTopStackView)
        additionalInfoView.addSubview(additionalInfoBottomStackView)
        
        additionalInfoTopStackView.addArrangedSubview(developerView)
        additionalInfoTopStackView.addArrangedSubview(publisherView)
        additionalInfoTopStackView.addArrangedSubview(platformView)
        
        additionalInfoBottomStackView.addArrangedSubview(releaseDateView)
        additionalInfoBottomStackView.addArrangedSubview(genreView)
        
        minSysReqView.addSubview(minSysReqLabel)
        minSysReqView.addSubview(minSysReqStackView)
        
        minSysReqStackView.addArrangedSubview(osView)
        minSysReqStackView.addArrangedSubview(processorView)
        minSysReqStackView.addArrangedSubview(minSysReqStorageStackView)
        minSysReqStackView.addArrangedSubview(graphicsView)
        
        minSysReqStorageStackView.addArrangedSubview(storageView)
        minSysReqStorageStackView.addArrangedSubview(memoryView)
    }

    func buildConstraints() {
        scrollView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().inset(14)
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(23)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(187)
        }
        
        playNowButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(21)
            make.leading.equalToSuperview()
        }
        
        playLaterButton.snp.makeConstraints { make in
            make.top.equalTo(playNowButton.snp.top)
            make.leading.equalTo(playNowButton.snp.trailing).offset(5)
            make.trailing.equalToSuperview()
            make.width.equalTo(100)
        }
        
        infoTitleView.snp.makeConstraints { make in
            make.top.equalTo(playNowButton.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().offset(1)
            make.width.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
        }
        
        additionalInfoView.snp.makeConstraints { make in
            make.top.equalTo(infoTitleView.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().offset(1)
            make.width.equalToSuperview()
        }
        
        additionalInfoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(additionalInfoTopStackView.snp.top).offset(-7)
        }
        
        additionalInfoTopStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(additionalInfoBottomStackView.snp.top).offset(-15)
        }
        
        additionalInfoBottomStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-7)
        }
        
        minSysReqView.snp.makeConstraints { make in
            make.top.equalTo(additionalInfoView.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().offset(1)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
        
        minSysReqLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.centerX.equalToSuperview()
        }
        
        minSysReqStackView.snp.makeConstraints { make in
            make.top.equalTo(minSysReqLabel.snp.bottom).offset(7)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(7)
        }
    }
    
}

// MARK: - GameDetailsViewControllerProtocol
extension GameDetailsViewController: GameDetailsViewProtocol {
    
    func changePlayLaterButton(isInPlayLater: Bool) {
        playLaterButton.changePlayLaterIcon(when: isInPlayLater)
    }
    
    func setup(with game: GameDetails) {
        gameUrl = game.url
        title = game.title
        imageView.loadImage(from: game.image)
        titleLabel.text = game.title
        descriptionLabel.text = game.description
        developerView.setup(with: Strings.playLaterDeveloper(), and: game.developer)
        publisherView.setup(with: Strings.playLaterPublisher(), and: game.publisher)
        platformView.setup(with: Strings.playLaterPlatform(), and: game.platform.name)
        releaseDateView.setup(with: Strings.playLaterReleaseDate(), and: game.releaseDate)
        genreView.setup(with: Strings.playLaterGenre(), and: game.genre)
        
        if game.hasSystemRequirements {
            minSysReqView.isHidden = false
            
            guard let newGame = game.minSysReq else { return }
            
            osView.setup(with: Strings.playLaterOs(), and: newGame.os)
            processorView.setup(with: Strings.playLaterProcessor(), and: newGame.processor)
            graphicsView.setup(with: Strings.playLaterGraphics(), and: newGame.graphics)
            storageView.setup(with: Strings.playLaterStorage(), and: newGame.storage)
            memoryView.setup(with: Strings.playLaterMemory(), and: newGame.memory)
        }
    }

}

import UIKit

internal class ProfileViewController: UIViewController {

    private let presenter: ProfilePresenterProtocol
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Strings.profileIcon())
        imageView.frame = .init(x: 0, y: 0, width: 160, height: 160)
        imageView.contentMode = .scaleToFill
        imageView.tintColor = .black
        imageView.backgroundColor = Colors.lightGrey()
        return imageView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.text = Strings.profileUsernameDefault()
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = Strings.profileEmailDefault()
        return label
    }()
    
    private lazy var editProfileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.lightGrey()
        button.setTitleColor(.black, for: .normal)
        button.setTitle(Strings.profileEdit(), for: .normal)
        button.addTarget(self, action: #selector(goToEditProfile), for: .touchDown)
        return button
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()

    internal init(presenter: ProfilePresenterProtocol) {
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewDidLoad()
    }
    
    @objc private func goToEditProfile() {
        presenter.goToEditProfile()
    }
    
}

private extension ProfileViewController {
    
    func configViews() {
        view.backgroundColor = Colors.background()
        photoImageView.makeRounded()
    }
    
    func buildViews() {
        view.addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(photoImageView)
        containerStackView.addArrangedSubview(userNameLabel)
        containerStackView.addArrangedSubview(emailLabel)
        containerStackView.addArrangedSubview(editProfileButton)
    }
    
    func buildConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
        
        editProfileButton.snp.makeConstraints { make in
            make.width.equalTo(147)
            make.height.equalTo(25)
        }
        
        photoImageView.snp.makeConstraints { make in
            make.size.equalTo(160)
        }
    }
    
}

// MARK: - ProfileViewControllerProtocol
extension ProfileViewController: ProfileViewProtocol {
    
    func setup(with user: User?) {
        if let userNotNull = user {
            if let name = userNotNull.name {
                if name.isEmpty { userNameLabel.text = Strings.profileUsernameDefault() }
                else { userNameLabel.text = name }
            }
            
            if let email = userNotNull.email {
                if email.isEmpty { emailLabel.text = Strings.profileEmailDefault() }
                else { emailLabel.text = email }
            }
            
            guard let photoPath = userNotNull.photoPath else { return }
            photoImageView.loadImageFromDocuments(with: photoPath)
        }
    }

}

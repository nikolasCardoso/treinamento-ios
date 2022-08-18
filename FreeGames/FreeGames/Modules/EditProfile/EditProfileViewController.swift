import UIKit

internal class EditProfileViewController: UIViewController {

    private let presenter: EditProfilePresenterProtocol
    
    private var userInformations: [UserInformations:String?] = [.name: nil, .email: nil, .photoPath: nil]

    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Strings.profileIcon())
        imageView.frame = .init(x: 0, y: 0, width: 140, height: 140)
        imageView.contentMode = .scaleToFill
        imageView.tintColor = .black
        imageView.backgroundColor = Colors.lightGrey()
        return imageView
    }()
    
    private lazy var changePhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle(Strings.profileChangePhoto(), for: .normal)
        button.setTitleColor(Colors.lightBlue(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(takePhoto), for: .touchDown)
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.profileNameLabel()
        label.textColor = Colors.subInformation()
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = Strings.profileEmailLabel()
        label.textColor = Colors.subInformation()
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private lazy var saveProfileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.lightGrey()
        button.setTitleColor(.black, for: .normal)
        button.setTitle(Strings.profileSave(), for: .normal)
        button.addTarget(self, action: #selector(saveProfile), for: .touchDown)
        return button
    }()
    
    private lazy var galleryView: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    
    internal init(presenter: EditProfilePresenterProtocol) {
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
    
    @objc private func saveProfile() {
        presenter.saveProfileButtonTouched(with: userInformations)
    }
    
    @objc private func takePhoto() {
        present(galleryView, animated: true)
    }
    
}

private extension EditProfileViewController {
    
    func configViews() {
        title = Strings.profileEdit()
        view.backgroundColor = Colors.background()
        photoImageView.makeRounded()
        
        nameTextField.delegate = self
        nameTextField.addUnderline(with: view)
        emailTextField.delegate = self
        emailTextField.addUnderline(with: view)
        galleryView.delegate = self
    }
    
    func buildViews() {
        view.addSubview(photoImageView)
        view.addSubview(changePhotoButton)
        view.addSubview(containerStackView)
        view.addSubview(saveProfileButton)
        
        containerStackView.addArrangedSubview(nameLabel)
        containerStackView.addArrangedSubview(nameTextField)
        containerStackView.addArrangedSubview(emailLabel)
        containerStackView.addArrangedSubview(emailTextField)
    }
    
    func buildConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.size.equalTo(140)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.centerX.equalToSuperview()
        }
        
        changePhotoButton.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        containerStackView.snp.makeConstraints { make in
            make.top.equalTo(changePhotoButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(44)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(44)
        }
        
        saveProfileButton.snp.makeConstraints { make in
            make.top.equalTo(containerStackView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(changePhotoButton)
        }
    }
    
}

// MARK: - EditProfileViewControllerProtocol
extension EditProfileViewController: EditProfileViewProtocol {
    
    func setup(with user: User) {
        nameTextField.text = user.name
        emailTextField.text = user.email
        guard let photoPath = user.photoPath else { return }
        photoImageView.loadImageFromDocuments(with: photoPath)
    }

}

extension EditProfileViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
        case self.emailTextField:
            let email = textField.text
            userInformations[.email] = email
            break
        case self.nameTextField:
            let name = textField.text
            userInformations[.name] = name
            break
        default:
            break
        }
    }
    
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.originalImage] as? UIImage else { return }
        guard let imageURL = info[.imageURL] as? URL else { return }
        let fileName = imageURL.lastPathComponent
        
        image.saveToDocuments(with: fileName)
        
        userInformations[.photoPath] = fileName
        photoImageView.loadImageFromDocuments(with: fileName)
        dismiss(animated: true)
    }
    
}

import UIKit
import Rswift

internal class PlayLaterViewCell: UITableViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<PlayLaterViewCell> = ReuseIdentifier(identifier: "play-later-cell")
    
    weak var delegate: PlayLaterViewCellDelegate?
    
    private var game: GameDetails?
    
    private lazy var gameImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    private lazy var removeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Strings.playLaterRemoveIcon()), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = .red
        button.addTarget(self, action: #selector(removeGame), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var informationLabel: InformationLabel = {
        let informationLabel = InformationLabel()
        return informationLabel
    }()

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    func setup(with game: GameDetails) {
        self.game = game
        gameImageView.loadImage(from: game.image)
        titleLabel.text = game.title
        descriptionLabel.text = game.description
        informationLabel.setup(with: game.genre, and: game.platform.iconName)
    }
    
    @objc private func removeGame() {
        // TODO: remove from list
        if let gameNotNull = game {
            delegate?.didRemoveButtonTouched(with: gameNotNull)
        }
    }
    
}

// MARK: - Codable View
extension PlayLaterViewCell {

    internal func configViews() {
        backgroundColor = .white
    }

    internal func buildViews() {
        addSubview(gameImageView)
        addSubview(stackView)
        contentView.addSubview(removeButton)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(informationLabel)
    }

    internal func buildConstraints() {
        gameImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.width.equalTo(90)
            make.height.equalTo(75)
            make.centerY.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(gameImageView.snp.trailing).offset(9)
            make.centerY.equalToSuperview()
        }
        
        removeButton.snp.makeConstraints { make in
            make.leading.equalTo(stackView.snp.trailing)
            make.trailing.equalToSuperview().inset(7)
            make.size.equalTo(27)
            make.centerY.equalToSuperview()
        }
    }

}

protocol PlayLaterViewCellDelegate: AnyObject {
    
    func didRemoveButtonTouched(with game: GameDetails)
    
}

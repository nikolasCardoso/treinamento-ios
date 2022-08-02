import UIKit
import Rswift

internal class RepositoriesTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<RepositoriesTableViewCell> = ReuseIdentifier(identifier: "repository-cell")
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configViews()
        buildViews()
        configConstraints()
    }

    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with repository: Repository) {
        nameLabel.text = repository.name
    }
}

// MARK: - Codable View
extension RepositoriesTableViewCell {

    internal func configViews() {
        
    }

    internal func buildViews() {
        contentView.addSubview(nameLabel)
    }

    internal func configConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

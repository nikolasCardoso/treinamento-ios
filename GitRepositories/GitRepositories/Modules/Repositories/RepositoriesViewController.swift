import UIKit
import SnapKit
import SwiftUI

internal class RepositoriesViewController: UIViewController {

    private let presenter: RepositoriesPresenterProtocol
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()

    internal init(presenter: RepositoriesPresenterProtocol) {
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
        configConstraints()
        
        presenter.viewDidLoad(language: "swift")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .label
                                                     
        let barAppearance = UIBarAppearance()
        barAppearance.backgroundColor = Colors.baseColor()

        let appearance = UINavigationBarAppearance(barAppearance: barAppearance)

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

}

extension RepositoriesViewController {
    private func configViews() {
        view.backgroundColor = .blue
        title = Strings.repositoriesTitle()
        
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(RepositoriesTableViewCell.self, forCellReuseIdentifier: RepositoriesTableViewCell.reuseIdentifier.identifier)
    }

    private func buildViews() {
        view.addSubview(tableView)
    }

    private func configConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
}

// MARK: - RepositoriesViewControllerProtocol
extension RepositoriesViewController: RepositoriesViewProtocol {
    
    func reload() {
        tableView.reloadData()
    }
}

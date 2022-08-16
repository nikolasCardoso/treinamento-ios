import UIKit

internal class PlayLaterViewController: UIViewController {

    private let presenter: PlayLaterPresenterProtocol
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()

    internal init(presenter: PlayLaterPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        setupViews()
        buildViews()
        buildConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        presenter.viewWillAppear()
        searchBar.text = .none
    }
    
    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
}

extension PlayLaterViewController {
    
    private func setupViews() {
        view.backgroundColor = Colors.background()
        tableView.backgroundColor = Colors.background()
        
        searchBar.delegate = presenter
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(PlayLaterViewCell.self, forCellReuseIdentifier: PlayLaterViewCell.reuseIdentifier.identifier)
    }
    
    private func buildViews() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    private func buildConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.trailing.leading.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

// MARK: - PlayLaterViewControllerProtocol
extension PlayLaterViewController: PlayLaterViewProtocol {
    
    func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

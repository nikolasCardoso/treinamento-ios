import UIKit

internal class CoffeesViewController: UIViewController {

    private let presenter: CoffeesPresenterProtocol
    
    lazy var tableView: UITableView = {
        let tableView =  UITableView()
        tableView.separatorStyle = .none
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()

    internal init(presenter: CoffeesPresenterProtocol) {
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
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = Colors.coffees()
        navigationController?.navigationBar.tintColor = .label
    }
}

extension CoffeesViewController {
    func configViews() {
        title = Localizable.coffees()
        
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(CoffeeTableViewCell.self, forCellReuseIdentifier: CoffeeTableViewCell.reuseIdentifier.identifier)
    }
    
    func buildViews() {
        view.addSubview(tableView)
    }
    
    func buildConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
}

// MARK: - CoffeesViewControllerProtocol
extension CoffeesViewController: CoffeesViewProtocol {
    func reload() {
        tableView.reloadData()
    }
    
}

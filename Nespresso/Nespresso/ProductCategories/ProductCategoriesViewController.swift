//
//  ViewController.swift
//  Nespresso
//
//  Created by Nikolas Cardoso de Oliveira on 21/07/22.
//

import UIKit

class ProductCategoriesViewController: UIViewController {
    
    let presenter: ProductCategoriesPresenterProtocol

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    lazy var coffeeCategoryView: ProductCategoriesItemView = {
        let view = ProductCategoriesItemView(type: .coffees)
        view.delegate = self
        
        return view
    }()
    
    lazy var machinesCategoryView: ProductCategoriesItemView = {
        let view = ProductCategoriesItemView(type: .machines)
        view.delegate = self
        
        return view
    }()
    
    lazy var accessoriesCategoryView: ProductCategoriesItemView = {
        let view = ProductCategoriesItemView(type: .accessories)
        view.delegate = self
        
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }

    init(presenter: ProductCategoriesPresenterProtocol){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews(){
        view.backgroundColor = Colors.coffees()
    }
    
    func buildViews(){
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(coffeeCategoryView)
        stackView.addArrangedSubview(machinesCategoryView)
        stackView.addArrangedSubview(accessoriesCategoryView)
    }
    
    func buildConstraints(){
        stackView.snp.makeConstraints{ make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
}

extension ProductCategoriesViewController: ProductCategoriesViewControllerProtocol {
    
}

extension ProductCategoriesViewController: ProductCategoriesItemViewDelegateProtocol {
    func touched(type: ProductCategoriesItemViewType) {
        switch type {
        case .coffees:
            presenter.coffeesTouched()
        case .machines:
            presenter.machinesTouched()
        case .accessories:
            presenter.accessoriesTouched()
        }
    }
}

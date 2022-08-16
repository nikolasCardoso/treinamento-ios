//
//  LoadingIndicatorViewController.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 11/08/22.
//

import Foundation
import UIKit

class LoadingIndicatorViewController: UIViewController {
    
    lazy var indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.color = .black
        indicatorView.startAnimating()
        return indicatorView
    }()
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
}

extension LoadingIndicatorViewController {
    
    private func configViews() {
        view.backgroundColor = Colors.background()
    }
    
    private func buildViews() {
        view.addSubview(indicatorView)
    }
    
    private func buildConstraints() {
        indicatorView.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

protocol LoadingIIndicatorViewType: AnyObject {
    
    var loadingIndicatorViewController: LoadingIndicatorViewController? { get set }
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
}

extension LoadingIIndicatorViewType where Self: UIViewController {
    
    func showLoadingIndicator() {
        let viewController = LoadingIndicatorViewController()
        
        loadingIndicatorViewController = viewController
        present(viewController, animated: false)
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.loadingIndicatorViewController?.dismiss(animated: true)
            self.loadingIndicatorViewController = nil
        }
    }
    
}

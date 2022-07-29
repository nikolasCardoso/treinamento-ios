//
//  LoadingIndicatorViewController.swift
//  Nespresso
//
//  Created by Nikolas Cardoso de Oliveira on 27/07/22.
//

import Foundation
import UIKit

class LoadingIndicatorViewController: UIViewController {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.greyBackground()
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.color = .white
        view.startAnimating()
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildsViews()
        buildConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension LoadingIndicatorViewController {
    func configViews() {
        view.backgroundColor = .black //sobreposicao mudar cor
    }
    
    func buildsViews() {
        view.addSubview(containerView)
        
        containerView.addSubview(indicatorView)
    }
    
    func buildConstraints() {
        containerView.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.size.equalTo(150)
        }
        
        indicatorView.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.size.equalTo(50)
        }
    }
}

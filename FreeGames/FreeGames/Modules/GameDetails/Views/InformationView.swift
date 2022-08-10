//
//  InformationView.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 08/08/22.
//

import Foundation
import UIKit

class InformationView: UIView {
    
    private let emptyInformation: String = "?"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.subInformation()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with title: String, and information: String?) {
        titleLabel.text = title
        if information != nil {
            informationLabel.text = information
        } else {
            informationLabel.text = emptyInformation
        }
    }
    
}

extension InformationView {
    
    private func configViews() {
        
    }
    
    private func buildViews() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(informationLabel)
    }
    
    private func buildConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        informationLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
    }
    
}

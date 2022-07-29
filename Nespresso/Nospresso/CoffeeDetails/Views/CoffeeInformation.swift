//
//  CoffeeInformation.swift
//  Nospresso
//
//  Created by Nikolas Cardoso de Oliveira on 29/07/22.
//

import UIKit

class CoffeeInformation: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansBold(size: 14)
        label.textColor = .black
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansRegular(size: 14)
        label.textColor = Colors.textoCinzaDiscreto()
        label.numberOfLines = 0
        return label
    }()
    
    func setup(title: String, description: String){
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
    init() {
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CoffeeInformation {
    
    func configViews() {
        
    }
    
    func buildViews() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    func buildConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
    
}

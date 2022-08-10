//
//  InformationLabel.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 04/08/22.
//

import Foundation
import UIKit

class InformationLabel: UIView {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 9
        return stackView
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    init(){
        super.init(frame: .zero)
        
        setupViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with genre: String, and platform: String) {
        textLabel.text = genre
        imageView.image = UIImage(systemName: platform)
    }
    
    
}

extension InformationLabel {
    
    func setupViews() {
        textLabel.backgroundColor = Colors.labelBackground()
        imageView.backgroundColor = Colors.labelBackground()
        imageView.tintColor = .black
    }
    
    func buildViews() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(imageView)
    }
    
    func buildConstraints() {
        stackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.top.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(16)
        }
    }
    
}

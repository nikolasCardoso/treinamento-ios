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
    
    private lazy var boxGenre: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var boxPlatform: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var platformImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
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
        genreLabel.text = genre
        platformImageView.image = UIImage(systemName: platform)
    }
    
}

extension InformationLabel {
    
    func setupViews() {
        boxGenre.backgroundColor = Colors.labelBackground()
        boxPlatform.backgroundColor = Colors.labelBackground()
    }
    
    func buildViews() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(boxGenre)
        stackView.addArrangedSubview(boxPlatform)
        
        boxGenre.addSubview(genreLabel)
        boxPlatform.addSubview(platformImageView)
    }
    
    func buildConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        boxGenre.snp.makeConstraints { make in
            make.height.equalTo(16)
        }
        boxPlatform.snp.makeConstraints { make in
            make.height.equalTo(16)
        }
        
        genreLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(3)
            make.trailing.equalToSuperview().inset(3)
            make.top.bottom.equalToSuperview()
        }
        
        platformImageView.snp.makeConstraints { make in
            make.width.equalTo(16)
            make.leading.equalToSuperview().offset(3)
            make.trailing.equalToSuperview().inset(3)
            make.top.equalToSuperview().offset(1)
            make.bottom.equalToSuperview().inset(1)
        }
    }
    
}

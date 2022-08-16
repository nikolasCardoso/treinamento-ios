//
//  GamesViewCell.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 03/08/22.
//

import Foundation
import UIKit
import Rswift

class GamesViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<GamesViewCell> = ReuseIdentifier(identifier: "game-cell")
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    lazy var gradientLayerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    
    lazy var infoLabels: InformationLabel = {
        let label = InformationLabel()
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with game: Game) {
        titleLabel.text = game.title
        infoLabels.setup(with: game.genre, and: game.platform.iconName)
        imageView.loadImage(from: game.image)
    }
    
}

extension GamesViewCell {
    
    func configViews() {
        contentView.backgroundColor = .white
        imageView.addBlackGradientLayer(frame: contentView.bounds)
    }
    
    func buildViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(infoLabels)
    }
    
    func buildConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        infoLabels.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(5)
        }
    }
    
}

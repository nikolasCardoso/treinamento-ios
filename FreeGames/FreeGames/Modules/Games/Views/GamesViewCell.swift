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
    }
    
}

extension GamesViewCell {
    
    func configViews() {
    }
    
    func buildViews() {
        contentView.addSubview(titleLabel)
    }
    
    func buildConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
    }
    
}

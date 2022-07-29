//
//  CoffeeTableViewCell.swift
//  Nespresso
//
//  Created by Nikolas Cardoso de Oliveira on 27/07/22.
//

import Foundation
import UIKit
import Rswift

class CoffeeTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: ReuseIdentifier<CoffeeTableViewCell> = ReuseIdentifier(identifier: "coffee-cell")
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansSemiBold(size: 19)
        label.textColor = Colors.greyBackground()
        
        return label
    }()
    
    lazy var capsuleImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansLightItalic(size: 12)
        label.textColor = Colors.greyBackground()
        
        return label
    }()
    
    lazy var intensityLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansLightItalic(size: 9)
        label.textColor = Colors.discreetText()
        
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.openSansBold(size: 14)
        label.textColor = Colors.greenSeller()
        
        return label
    }()
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with coffee: Coffee){
        nameLabel.text = coffee.name
    }
}

extension CoffeeTableViewCell {
    func configViews() {
        backgroundColor = .white
    }
    
    func buildViews() {
        contentView.addSubview(nameLabel)
    }
    
    func buildConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

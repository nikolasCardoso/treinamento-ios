//
//  CoffeeTableViewHeader.swift
//  Nespresso
//
//  Created by Nikolas Cardoso de Oliveira on 27/07/22.
//

import Foundation
import UIKit

class CoffeeTableViewHeader: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("teste")
    }
    
    func setup(with title: String){
        titleLabel.text = title
    }
}

extension CoffeeTableViewHeader {
    func configViews() {
        backgroundColor = Colors.greyBackground()
    }
    
    func buildViews() {
        addSubview(titleLabel)
    }
    
    func buildConstraints() {
        titleLabel.snp.makeConstraints{ make in
            make.edges.
        }
    }
}

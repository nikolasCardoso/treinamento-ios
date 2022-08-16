//
//  UITextField+Underline.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 15/08/22.
//

import Foundation
import UIKit

extension UITextField {
    
    func addUnderline(with view: UIView) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 37, width: view.frame.width - 30, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
    
}

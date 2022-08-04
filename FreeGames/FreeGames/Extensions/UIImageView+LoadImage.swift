//
//  UIImageView+LoadImage.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 04/08/22.
//

import Foundation
import UIKit
import Nuke

extension UIImageView {
    
    func loadImage(from url: String) {
        guard let url = URL(string: url) else { return }
        
        Nuke.loadImage(with: url,
                       options: ImageLoadingOptions(placeholder: UIImage(systemName: "photo")),
                       into: self)
    }
    
}

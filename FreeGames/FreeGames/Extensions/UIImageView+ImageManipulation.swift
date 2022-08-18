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
                       options: ImageLoadingOptions(placeholder: UIImage(systemName: Strings.imagePlaceholderIcon())),
                       into: self)
    }
    
    func loadImageFromDocuments(with fileName: String) {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let imagePath = path?.appendingPathComponent(fileName)
        
        Nuke.loadImage(with: imagePath,
                       options: ImageLoadingOptions(placeholder: UIImage(systemName: Strings.imagePlaceholderIcon())),
                       into: self)
    }

    func addBlackGradientLayer(frame: CGRect){
         let gradient = CAGradientLayer()
        
         gradient.frame = frame
         gradient.colors = [
             UIColor.black.withAlphaComponent(0).cgColor,
             UIColor.black.withAlphaComponent(0.15).cgColor,
             UIColor.black.withAlphaComponent(1).cgColor,
         ]
         self.layer.addSublayer(gradient)
    }
    
    func makeRounded() {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
    
}

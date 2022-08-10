//
//  UIButton+PlayLaterIconChange.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 10/08/22.
//

import Foundation
import UIKit

extension UIButton {
    
    func changePlayLaterIcon(when isInPlayLater: Bool) {
        if isInPlayLater {
            self.setImage(UIImage(systemName: Strings.playLaterIconFilled()), for: .normal)
        } else {
            self.setImage(UIImage(systemName: Strings.playLaterIcon()), for: .normal)
        }
    }
    
}

//
//  UIViewController+Alert.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 16/08/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            self.present(controller, animated: true, completion: nil)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                controller.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}

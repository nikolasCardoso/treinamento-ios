//
//  UIViewController+QoL.swift
//  Nespresso
//
//  Created by Nikolas Cardoso de Oliveira on 27/07/22.
//

import Foundation
import UIKit

extension UIViewController {
    func removeBackButtonLabel(){
        navigationItem.backBarButtonItem = .init(title: "", style: .plain, target: nil, action: nil)
    }
    
    func showAlert(title: String, message: String){
        DispatchQueue.main.async {
            let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
            self.present(controller, animated: true)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                controller.dismiss(animated: true)
            }
        }
    }
}

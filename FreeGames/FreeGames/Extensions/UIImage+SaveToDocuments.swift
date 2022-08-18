//
//  UIImage+SaveToDocuments.swift
//  FreeGames
//
//  Created by Nikolas Cardoso de Oliveira on 17/08/22.
//

import Foundation
import UIKit

extension UIImage {
    
    func saveToDocuments(with fileName: String) {
        guard let documentsDirectory = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first else { return }

        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = self.jpegData(compressionQuality: 0) else { return }

        try? data.write(to: fileURL)
    }
    
}

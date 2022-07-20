//
//  String+AttributedText.swift
//  Forca
//
//  Created by Nikolas Cardoso de Oliveira on 20/07/22.
//

import Foundation
import UIKit

extension String {
    
    var spaced: NSMutableAttributedString{
        NSMutableAttributedString(string: self, attributes: [.kern: 12])
    }
    
    var rightColor: NSMutableAttributedString{
        NSMutableAttributedString(string: self, attributes: [.foregroundColor: UIColor.green])
    }
    
    var wrongColor: NSMutableAttributedString{
        NSMutableAttributedString(string: self, attributes: [.foregroundColor: UIColor.red])
    }
}

extension NSMutableAttributedString {
    var spaced: NSMutableAttributedString{
        let mutableString = NSMutableAttributedString(attributedString: self)
        
        mutableString.addAttributes([.kern: 12], range: NSMakeRange(0, self.length))
        return mutableString
    }
}

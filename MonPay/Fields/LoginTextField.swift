//
//  LoginTextField.swift
//  MonPay
//
//  Created by Teodor on 04/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class LoginTextField: UITextField {
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: CGPoint(x: bounds.origin.x + 19, y: bounds.origin.y), size: CGSize(width: bounds.size.width - 19, height: bounds.size.height))
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: CGPoint(x: bounds.origin.x + 19, y: bounds.origin.y), size: CGSize(width: bounds.size.width - 19, height: bounds.size.height))
    }
    
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        var rectangle = super.clearButtonRect(forBounds: bounds)
        rectangle.origin.x -= 14
        return rectangle
    }

}

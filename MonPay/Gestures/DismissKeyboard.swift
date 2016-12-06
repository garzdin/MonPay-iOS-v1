//
//  DismissKeyboard.swift
//  MonPay
//
//  Created by Teodor on 06/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

extension UIViewController {
    func dismissKeyboardWhenViewTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

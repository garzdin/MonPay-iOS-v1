//
//  PasswordResetViewController.swift
//  MonPay
//
//  Created by Teodor on 04/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class PasswordResetViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var emailField: LoginTextField! {
        didSet {
            emailField.delegate = self
        }
    }
    @IBOutlet var emailFieldError: UILabel!
    @IBOutlet var successMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailFieldError.isHidden = true
        self.successMessage.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reset() {
        self.emailFieldError.isHidden = true
        self.successMessage.isHidden = true
        if self.emailField.text == "" {
            self.emailFieldError.text = "Email required"
            self.emailFieldError.isHidden = false
            return
        }
        RequestFactory.sharedInstance.reset(email: self.emailField.text!) { (success, emailFieldError) in
            if success == true {
                self.emailField.text = ""
                self.successMessage.isHidden = false
            } else {
                if emailFieldError != nil {
                    self.emailFieldError.isHidden = false
                    self.emailFieldError.text = emailFieldError
                }
            }
        }
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        self.reset()
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailField:
            textField.resignFirstResponder()
            self.reset()
            break
        default:
            textField.resignFirstResponder()
            break
        }
        return false
    }
}

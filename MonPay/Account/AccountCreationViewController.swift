//
//  AccountCreationViewController.swift
//  MonPay
//
//  Created by Teodor on 04/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class AccountCreationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var emailField: LoginTextField! {
        didSet {
            emailField.delegate = self
        }
    }
    @IBOutlet var passwordField: LoginTextField! {
        didSet {
            passwordField.delegate = self
        }
    }
    @IBOutlet var confirmField: LoginTextField! {
        didSet {
            confirmField.delegate = self
        }
    }
    @IBOutlet var emailFieldError: UILabel!
    @IBOutlet var passwordFieldError: UILabel!
    @IBOutlet var confirmFieldError: UILabel!
    @IBOutlet var successLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailFieldError.isHidden = true
        self.passwordFieldError.isHidden = true
        self.confirmFieldError.isHidden = true
        self.successLabel.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createAccount() {
        self.emailFieldError.isHidden = true
        self.passwordFieldError.isHidden = true
        self.confirmFieldError.isHidden = true
        self.successLabel.isHidden = true
        if emailField.text == "" {
            self.emailFieldError.text = "Email required"
            self.emailFieldError.isHidden = false
            return
        }
        if passwordField.text == "" {
            self.passwordFieldError.text = "Password required"
            self.passwordFieldError.isHidden = false
            return
        }
        if confirmField.text == "" {
            self.confirmFieldError.text = "Confirmation required"
            self.confirmFieldError.isHidden = false
            return
        }
        if confirmField.text != passwordField.text {
            self.confirmFieldError.text = "Confirmation mismatch"
            self.confirmFieldError.isHidden = false
            return
        }
        RequestFactory.sharedInstance.register(email: emailField.text!, password: passwordField.text!) { (success, emailFieldError, passwordFieldError) in
            if success == true {
                self.emailField.text = ""
                self.passwordField.text = ""
                self.confirmField.text = ""
                self.successLabel.isHidden = false
            } else {
                if emailFieldError != nil {
                    self.emailFieldError.isHidden = false
                    self.emailFieldError.text = emailFieldError
                }
                if passwordFieldError != nil {
                    self.passwordFieldError.isHidden = false
                    self.passwordFieldError.text = passwordFieldError
                }
            }
        }
    }
    
    @IBAction func createAccountAction(_ sender: UIButton) {
        self.createAccount()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailField:
            passwordField.becomeFirstResponder()
            break
        case passwordField:
            confirmField.becomeFirstResponder()
            break
        case confirmField:
            textField.resignFirstResponder()
            self.createAccount()
            break
        default:
            textField.resignFirstResponder()
            break
        }
        return false
    }

    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

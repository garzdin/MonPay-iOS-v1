//
//  LoginViewController.swift
//  MonPay
//
//  Created by Teodor on 04/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var usernameField: LoginTextField! {
        didSet {
            usernameField.delegate = self
        }
    }
    
    @IBOutlet var passwordField: LoginTextField! {
        didSet {
            passwordField.delegate = self
        }
    }
    
    @IBOutlet var emailFieldErrorLabel: UILabel!
    @IBOutlet var passwordFieldErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailFieldErrorLabel.isHidden = true
        self.passwordFieldErrorLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func login() {
        self.emailFieldErrorLabel.isHidden = true
        self.passwordFieldErrorLabel.isHidden = true
        if usernameField.text == "" {
            self.emailFieldErrorLabel.isHidden = false
            self.emailFieldErrorLabel.text = "Username required"
            return
        }
        if passwordField.text == "" {
            self.passwordFieldErrorLabel.isHidden = false
            self.passwordFieldErrorLabel.text = "Password required"
            return
        }
        RequestFactory.sharedInstance.login(email: self.usernameField.text!, password: self.passwordField.text!, completion: { success, emailFieldError, passwordFieldError in
            if success == true {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "mainTabBarViewController") as! UITabBarController
                self.present(controller, animated: true, completion: {
                    self.usernameField.text = ""
                    self.passwordField.text = ""
                })
            } else {
                if emailFieldError != nil {
                    self.emailFieldErrorLabel.isHidden = false
                    self.emailFieldErrorLabel.text = emailFieldError
                }
                if passwordFieldError != nil {
                    self.passwordFieldErrorLabel.isHidden = false
                    self.passwordFieldErrorLabel.text = passwordFieldError
                }
            }
        })
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        self.login()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameField:
            passwordField.becomeFirstResponder()
            break
        case passwordField:
            self.login()
            break
        default:
            textField.resignFirstResponder()
            break
        }
        return false
    }
}

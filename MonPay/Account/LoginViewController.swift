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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "mainTabBarViewController") as! UITabBarController
        self.present(controller, animated: true, completion: {
            self.usernameField.text = ""
            self.passwordField.text = ""
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (textField == usernameField) {
            passwordField.becomeFirstResponder()
        }
        return false
    }
}

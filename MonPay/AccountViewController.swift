//
//  AccountViewController.swift
//  MonPay
//
//  Created by Teodor on 04/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit
import KeychainSwift

class AccountViewController: UIViewController {
    
    let keychain: KeychainSwift = KeychainSwift(keyPrefix: "monPay_")

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
        if self.presentingViewController != nil {
            self.dismiss(animated: true, completion: {
                self.keychain.delete("token")
            })
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(controller, animated: true, completion: {
                self.keychain.delete("token")
            })
        }
    }
}

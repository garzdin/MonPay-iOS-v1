//
//  AccountViewController.swift
//  MonPay
//
//  Created by Teodor on 04/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cardsAction(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "cardsNavigationController") as! UINavigationController
        self.present(controller, animated: true, completion: nil)
    }
}

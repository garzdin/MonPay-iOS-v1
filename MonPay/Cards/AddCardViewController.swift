//
//  AddCardViewController.swift
//  MonPay
//
//  Created by Teodor on 05/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController {

    @IBOutlet var cardName: LoginTextField!
    @IBOutlet var cardNumber: LoginTextField!
    @IBOutlet var cardExpirationDate: LoginTextField!
    @IBOutlet var cardCVV: LoginTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let continueButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(cancelAddCard(sender:)))
        self.navigationItem.setRightBarButton(continueButton, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancelAddCard(sender: UIBarButtonItem) {
        print("Add card")
        performSegue(withIdentifier: "addCard", sender: sender)
    }
}

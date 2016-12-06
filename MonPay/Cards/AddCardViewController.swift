//
//  AddCardViewController.swift
//  MonPay
//
//  Created by Teodor on 05/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var cardName: LoginTextField! {
        didSet {
            cardName.delegate = self
        }
    }
    @IBOutlet var cardNumber: LoginTextField! {
        didSet {
            cardNumber.delegate = self
        }
    }
    @IBOutlet var cardExpirationDate: LoginTextField! {
        didSet {
            cardExpirationDate.delegate = self
        }
    }
    @IBOutlet var cardCVV: LoginTextField! {
        didSet {
            cardCVV.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboardWhenViewTapped()
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (textField == cardName) {
            cardNumber.becomeFirstResponder()
        }
        return false
    }
}

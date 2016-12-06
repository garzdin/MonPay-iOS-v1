//
//  TransferStepOneViewController.swift
//  MonPay
//
//  Created by Teodor on 05/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class TransferStepOneViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var amountField: LoginTextField!
    @IBOutlet var feesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboardWhenViewTapped()
        self.title = "Transfer"
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        self.feesLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindFromStepThreeCancel(segue: UIStoryboardSegue) {
        self.amountField.text = ""
    }
    
    @IBAction func goToStepTwo(_ sender: UIBarButtonItem) {
        self.amountField.resignFirstResponder()
        self.performSegue(withIdentifier: "transferStepTwo", sender: sender)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        self.navigationItem.rightBarButtonItem?.isEnabled = !newText.isEmpty
        self.feesLabel.isHidden = newText.isEmpty
        return true
    }
}

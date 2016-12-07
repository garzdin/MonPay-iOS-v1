//
//  TransferStepOneViewController.swift
//  MonPay
//
//  Created by Teodor on 05/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class TransferStepOneViewController: UIViewController, UITextFieldDelegate, ChooseCardDelegate {

    @IBOutlet var amountField: LoginTextField!
    @IBOutlet var feesLabel: UILabel!
    @IBOutlet var chosenCardImageView: UIImageView!
    @IBOutlet var chosenCardNumberLabel: UILabel!
    @IBOutlet var chosenCardExpirationDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboardWhenViewTapped()
        self.title = "Transfer"
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        self.feesLabel.isHidden = true
        self.chosenCardImageView.image = UIImage(named: "Visa")
        self.chosenCardNumberLabel.text = "**** **** **** 1234"
        self.chosenCardExpirationDateLabel.text = "07/2017"
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
    
    @IBAction func chooseCardAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "chooseCardNavigationController") as! UINavigationController
        let chooseCardTableView = controller.topViewController as! ChooseCardTableViewController
        chooseCardTableView.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    func didChooseCard(cell: ChooseCardTableViewCell) {
        DispatchQueue.main.async {
            self.chosenCardImageView.image = cell.cardLogo.image
            self.chosenCardNumberLabel.text = cell.cardNumber.text
            self.chosenCardExpirationDateLabel.text = cell.cardExpirationDate.text
        }
    }
}

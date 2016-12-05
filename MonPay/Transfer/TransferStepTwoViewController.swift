//
//  TransferStepTwoViewController.swift
//  MonPay
//
//  Created by Teodor on 05/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class TransferStepTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Beneficiery"
        let continueButton = UIBarButtonItem(title: "Continue", style: .plain, target: self, action: #selector(goToStepThree(sender:)))
        self.navigationItem.setRightBarButton(continueButton, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func goToStepThree(sender: UIBarButtonItem) {
        performSegue(withIdentifier: "transferStepThree", sender: sender)
    }
}

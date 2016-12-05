//
//  TransferStepThreeViewController.swift
//  MonPay
//
//  Created by Teodor on 05/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class TransferStepThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Confirm"
        let continueButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction(sender:)))
        self.navigationItem.setRightBarButton(continueButton, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func cancelAction(sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "unwindFromStepThree", sender: self)
    }
}

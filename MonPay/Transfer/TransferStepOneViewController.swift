//
//  TransferStepOneViewController.swift
//  MonPay
//
//  Created by Teodor on 05/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class TransferStepOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transfer"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindFromStepThreeCancel(segue: UIStoryboardSegue) {}
}

//
//  TransferCompletedViewController.swift
//  MonPay
//
//  Created by Teodor on 06/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit
import Money

class TransferCompletedViewController: UIViewController {
    
    var image: UIImage? {
        didSet {
            if let _ = view {
                self.beneficiaryProfileImage.image = image
            }
        }
    }
    var name: String? {
        didSet {
            if let _ = view {
                self.beneficiaryNameLabel.text = name
            }
        }
    }
    var amount: Int? {
        didSet {
            if let _ = view {
                self.beneficiaryAmountLabel.text = "\(Money(1000))"
            }
        }
    }

    @IBOutlet var beneficiaryProfileImage: UIImageView!
    @IBOutlet var beneficiaryNameLabel: UILabel!
    @IBOutlet var beneficiaryAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closeTransactionWindow(sender:)))
        self.navigationItem.setRightBarButton(doneButton, animated: true)
        self.beneficiaryProfileImage.layer.cornerRadius = self.beneficiaryProfileImage.frame.size.width / 2
        self.beneficiaryProfileImage.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func closeTransactionWindow(sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "unwindFromTransferCompleted", sender: sender)
    }
}

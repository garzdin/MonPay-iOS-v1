//
//  TransferStepThreeViewController.swift
//  MonPay
//
//  Created by Teodor on 05/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit
import Money

class TransferStepThreeViewController: UIViewController {
    
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
                self.beneficiaryProfileName.text = name
            }
        }
    }
    var amount: Int? {
        didSet {
            if let _ = view {
                self.beneficiaryAmount.text = "\(Money(1000))"
            }
        }
    }

    @IBOutlet var beneficiaryProfileImage: UIImageView!
    @IBOutlet var beneficiaryProfileName: UILabel!
    @IBOutlet var beneficiaryAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Confirm"
        let continueButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction(sender:)))
        self.navigationItem.setRightBarButton(continueButton, animated: true)
        self.beneficiaryProfileImage.layer.cornerRadius = self.beneficiaryProfileImage.frame.size.width / 2
        self.beneficiaryProfileImage.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "transferComplete") {
            let controller = segue.destination as! TransferCompletedViewController
            controller.image = self.image
            controller.name = name
            controller.amount = self.amount
            
        }
    }
    
    func cancelAction(sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "unwindFromStepThree", sender: self)
    }
    
    @IBAction func transferAction(_ sender: UIButton) {
        print("DONE")
    }
}

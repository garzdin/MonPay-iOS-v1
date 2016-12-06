//
//  BeneficiaryCollectionViewCell.swift
//  MonPay
//
//  Created by Teodor on 06/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class BeneficiaryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var beneficiaryProfilePicture: UIImageView!
    @IBOutlet var beneficiaryNameLabel: UILabel!
    @IBOutlet var beneficiarySelectedView: UIView!
    @IBOutlet var beneficiarySelectedCheckmark: UIImageView!
    var beneficiarySelected: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.beneficiaryProfilePicture.layer.cornerRadius = self.beneficiaryProfilePicture.frame.size.width / 2
        self.beneficiaryProfilePicture.clipsToBounds = true
        self.beneficiarySelectedView.layer.cornerRadius = self.beneficiarySelectedView.frame.size.width / 2
        self.beneficiarySelectedView.isHidden = true
        self.beneficiarySelectedCheckmark.isHidden = true
    }
    
}

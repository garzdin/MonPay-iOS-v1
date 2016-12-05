//
//  CardTableViewCell.swift
//  MonPay
//
//  Created by Teodor on 05/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet var cardLogo: UIImageView!
    @IBOutlet var cardNumber: UILabel!
    @IBOutlet var cardExpirationDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let selectedView = UIView(frame: self.bounds)
        selectedView.backgroundColor = UIColor(red: 21/255.0, green: 36/255.0, blue: 51/255.0, alpha: 1.0)
        self.selectedBackgroundView = selectedView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

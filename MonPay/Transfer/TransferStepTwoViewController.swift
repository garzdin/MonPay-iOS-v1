//
//  TransferStepTwoViewController.swift
//  MonPay
//
//  Created by Teodor on 05/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit

class TransferStepTwoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate {
    
    var users: [String] = []

    @IBOutlet var beneficiarySearchField: LoginTextField!
    @IBOutlet var beneficiariesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Beneficiery"
        let continueButton = UIBarButtonItem(title: "Continue", style: .plain, target: self, action: #selector(goToStepThree(sender:)))
        self.navigationItem.setRightBarButton(continueButton, animated: true)
        self.beneficiariesCollectionView.delegate = self
        self.beneficiariesCollectionView.dataSource = self
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func goToStepThree(sender: UIBarButtonItem) {
        performSegue(withIdentifier: "transferStepThree", sender: sender)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "beneficiaryCell", for: indexPath) as! BeneficiaryCollectionViewCell
        cell.beneficiaryProfilePicture.image = UIImage(named: "Profile")
        cell.beneficiaryNameLabel.text = self.users[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for cell in collectionView.visibleCells as! [BeneficiaryCollectionViewCell] {
            if (cell.beneficiarySelected == true) {
                DispatchQueue.main.async {
                    cell.beneficiarySelectedView.isHidden = true
                    cell.beneficiarySelectedCheckmark.isHidden = true
                }
                cell.beneficiarySelected = false
            }
        }
        let cell = collectionView.cellForItem(at: indexPath) as! BeneficiaryCollectionViewCell
        cell.beneficiarySelected = true
        DispatchQueue.main.async {
            cell.beneficiarySelectedView.isHidden = !cell.beneficiarySelectedView.isHidden
            cell.beneficiarySelectedCheckmark.isHidden = !cell.beneficiarySelectedCheckmark.isHidden
        }
    }
    
    func getData() {
        self.users = ["John Doe", "Jane Doe", "Mark Whalberg", "Ben Afleck"]
        self.beneficiariesCollectionView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == beneficiarySearchField) {
            textField.resignFirstResponder()
        }
        print(textField.text)
        return false
    }
}

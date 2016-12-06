//
//  TransferStepTwoViewController.swift
//  MonPay
//
//  Created by Teodor on 05/12/2016.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import UIKit
import Money

class TransferStepTwoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate {
    
    var users: [String] = []
    var usersStore: [String] = []

    @IBOutlet var beneficiarySearchField: LoginTextField!
    @IBOutlet var beneficiariesCollectionView: UICollectionView!
    @IBOutlet var recenBeneficiariesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Beneficiery"
        let continueButton = UIBarButtonItem(title: "Continue", style: .plain, target: self, action: #selector(goToStepThree(sender:)))
        self.navigationItem.setRightBarButton(continueButton, animated: true)
        self.navigationItem.rightBarButtonItem?.isEnabled = false
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
        cell.beneficiarySelected = !cell.beneficiarySelected
        DispatchQueue.main.async {
            cell.beneficiarySelectedView.isHidden = !cell.beneficiarySelectedView.isHidden
            cell.beneficiarySelectedCheckmark.isHidden = !cell.beneficiarySelectedCheckmark.isHidden
        }
        self.navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "transferStepThree") {
            if let destinationVC = segue.destination as? TransferStepThreeViewController {
                for cell in beneficiariesCollectionView.visibleCells as! [BeneficiaryCollectionViewCell] {
                    if (cell.beneficiarySelected == true) {
                        destinationVC.image = cell.beneficiaryProfilePicture.image
                        destinationVC.name = cell.beneficiaryNameLabel.text
                        destinationVC.amount = 1000
                    }
                }
            }
        }
    }
    
    func getData() {
        self.users = ["John Doe", "Jane Doe", "Mark Whalberg", "Ben Afleck"]
        self.usersStore = self.users
        self.beneficiariesCollectionView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == beneficiarySearchField) {
            textField.resignFirstResponder()
        }
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if (textField == beneficiarySearchField) {
            if (!newText.isEmpty) {
                self.recenBeneficiariesLabel.text = "Search results"
                var filterd: [String] = []
                for user in self.users {
                    if (user.lowercased().range(of: (newText.lowercased())) != nil) {
                        filterd.append(user)
                    }
                }
                users = filterd
                self.beneficiariesCollectionView.reloadData()
            } else {
                self.recenBeneficiariesLabel.text = "Recent beneficiaries"
                self.users = self.usersStore
                self.beneficiariesCollectionView.reloadData()
            }
        }
        return true
    }
}

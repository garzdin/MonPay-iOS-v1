//
//  Keychain.swift
//  MonPay
//
//  Created by Teodor on 12/01/2017.
//  Copyright © 2017 TeodorGarzdin. All rights reserved.
//

import KeychainSwift

class Keychain {
    static let sharedInstace: KeychainSwift = KeychainSwift(keyPrefix: "monPay_")
}

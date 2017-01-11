//
//  Factory.swift
//  MonPay
//
//  Created by Teodor on 11/01/2017.
//  Copyright © 2017 TeodorGarzdin. All rights reserved.
//

import Alamofire
import KeychainSwift

class RequestFactory {
    let endpoint: URLConvertible = "http://127.0.0.1:8080/api/"
    let version: Int = 1
    let keychain: KeychainSwift = KeychainSwift(keyPrefix: "monPay_")
    
    func login(email: String, password: String, completion: @escaping (_ success: Bool) -> Void) {
        let parameters: Parameters = [
            "email": email,
            "password": password
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        Alamofire.request("\(endpoint)v\(version)/account/login", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if let json = response.result.value as? [String: Any] {
                if let jwt = json["token"] as? String {
                    self.keychain.set(jwt, forKey: "token")
                    completion(true)
                }
            }
        }
        completion(false)
    }
}

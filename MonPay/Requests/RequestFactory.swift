//
//  RequestFactory.swift
//  MonPay
//
//  Created by Teodor on 11/01/2017.
//  Copyright © 2017 TeodorGarzdin. All rights reserved.
//

import Alamofire

class RequestFactory {
    static let sharedInstance = RequestFactory()
    var endpoint: URLConvertible = "http://192.168.0.100:8080/api/v1/"
    
    func request(url: URLConvertible, method: HTTPMethod, parameters: Parameters, headers: HTTPHeaders, completion: @escaping (_ response: [String: Any]?, _ error: [String: Any]?) -> Void) {
        Alamofire.request("\(endpoint)\(url)", method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if let responseDict = response.result.value as? [String: Any] {
                if let _ = responseDict["code"] as? Int {
                    completion(nil, responseDict)
                } else {
                    completion(responseDict, nil)
                }
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping (_ success: Bool, _ emailFieldError: String?, _ passwordFieldError: String?) -> Void) {
        let parameters: Parameters = [
            "email": email,
            "password": password
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        self.request(url: "account/login", method: .post, parameters: parameters, headers: headers) { response, error in
            if error != nil {
                if let errorCode = error?["code"] as? Int, let errorDescription = error?["description"] as? String {
                    switch (errorCode) {
                        case 1:
                            completion(false, errorDescription, nil)
                            break
                        case 2:
                            completion(false, nil, errorDescription)
                            break
                        default: break
                    }
                }
            }
            if let token = response?["token"] as? String {
                Keychain.sharedInstace.set(token, forKey: "token")
                completion(true, nil, nil)
            }
        }
    }
    
    func register(email: String, password: String, completion: @escaping (_ success: Bool, _ emailFieldError: String?, _ passwordFieldError: String?) -> Void) {
        let parameters: Parameters = [
            "email": email,
            "password": password
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        self.request(url: "account/create", method: .post, parameters: parameters, headers: headers) { response, error in
            if error != nil {
                if let errorCode = error?["code"] as? Int, let errorDescription = error?["description"] as? String {
                    switch (errorCode) {
                    case 1:
                        completion(false, errorDescription, nil)
                        break
                    case 2:
                        completion(false, nil, errorDescription)
                        break
                    default: break
                    }
                }
            } else {
                completion(true, nil, nil)
            }
        }
    }
}

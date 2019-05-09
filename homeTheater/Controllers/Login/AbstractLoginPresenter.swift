//
//  AbstractLoginPresenter.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/5/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import Foundation
import MBProgressHUD

enum LoginError: Error {
    case wrongPassword
    case unregisteredUser
    case emptyData
}

protocol AbstractLoginPresenter: class {
    func logIn(email: String, password: String)
    func gotoRegistration()
    func notify(with result: Result<User, LoginError>)
    func authentify(email: String, password: String, completion: (Result<User, LoginError>) -> Void)
}

extension AbstractLoginPresenter {
    
    func logIn(email: String, password: String) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.authentify(email: email, password: password) { (result) in
                DispatchQueue.main.async {
                    self?.notify(with: result)
                }
            }
        }
    }
}


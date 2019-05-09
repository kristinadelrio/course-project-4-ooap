//
//  AbstractLoginPresenter.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/5/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import Foundation

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
        authentify(email: email, password: password) { [weak self] (result) in
            self?.notify(with: result)
        }
    }
}


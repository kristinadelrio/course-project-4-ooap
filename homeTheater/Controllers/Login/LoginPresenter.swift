//
//  LoginPresenter.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/5/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit

typealias CompletionHandler = Result<User, LoginError>

class LoginPresenter: AbstractLoginPresenter {
    
    private unowned let contentView: LoginContentView
    
    init(contentView: LoginContentView) {
        self.contentView = contentView
    }
    
    func gotoRegistration() {
        contentView.navigate(to: ApplicationRoute.get(.registration))
    }
    
    func notify(with result: Result<User, LoginError>) {
        switch result {
        case .success(let user):
            contentView.navigate(to: ApplicationRoute.get(.homeTheater(user: user)))
        case .failure(let error):
            switch error {
            case .unregisteredUser: contentView.setunregisteredUserState()
            case .wrongPassword: contentView.setWrongPasswordState()
            case .emptyData: contentView.setEmptyFieldsState()
            }
        }
    }
    
    func authentify(email: String, password: String, completion: (CompletionHandler) -> Void) {
        guard !email.isEmpty, !password.isEmpty else {
            completion(.failure(.emptyData))
            return
        }
        
        guard let user = UserRepository.getUser(by: email) else {
            completion(.failure(.unregisteredUser))
            return
        }
        
        guard user.password == password else {
            completion(.failure(.wrongPassword))
            return
        }
        
        completion(.success(user))
    }
}

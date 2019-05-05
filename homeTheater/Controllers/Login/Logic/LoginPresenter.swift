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
        contentView.setToNavigation(controllers: ApplicationRoute.get(.registrationFlow))
    }
    
    func notify(with result: Result<User, LoginError>) {
        switch result {
        case .success(let user):
            let controllers = ApplicationRoute.get(.homeTheater(user: user))
            contentView.setToNavigation(controllers: controllers)
        case .failure(let error):
            switch error {
            case .unregisteredUser: contentView.set(state: .unregisteredUser)
            case .wrongPassword: contentView.set(state: .wrongPassword)
            case .emptyData: contentView.set(state: .emptyFields)
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

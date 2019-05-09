//
//  RegisterPresenter.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/5/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit

protocol RegisterationContentView: class {
    func update(with model: RegisterRouteModel, animated: Bool)
    func setSuccessfulRegState()
    func setDataDidNotMatchState()
    func setUserEmptyDataState()
    func setUndefinedErrorState()
    func setUserAlreadyExistState()
}

class RegisterationPresenter {
    
    private unowned let contentView: RegisterationContentView
    private var currentIndex = 0
    private let models = [
        RegisterRouteModel(title: "What is your name?",
                               isPassword: false,
                               placeholder: "Name",
                               image: UIImage(named: "name")!),
        RegisterRouteModel(title: "Enter your email",
                               isPassword: false,
                               placeholder: "Email",
                               image: UIImage(named: "email")!),
        RegisterRouteModel(title: "Please, come up with a password",
                               isPassword: true,
                               placeholder: "Password",
                               image: UIImage(named: "password")!)
    ]
    
    private var user: User?
    
    init(contentView: RegisterationContentView) {
        self.contentView = contentView
        contentView.update(with: models[0], animated: false)
        user = User(name: "", email: "", password: "")
    }
    
    func onNext(currentData: String, checker: String) {
        guard !currentData.isEmpty else {
            contentView.setUserEmptyDataState()
            return
        }
        
        switch currentIndex {
        case 0:
            user?.name = currentData
        case 1:
            guard UserRepository.getUser(by: currentData) == nil else {
                contentView.setUserAlreadyExistState()
                return
            }
            user?.email = currentData
            
        case 2:
            guard currentData == checker else {
                contentView.setDataDidNotMatchState()
                return
            }
            user?.password = currentData
            
        default:
            break
        }
        
        if currentIndex == 2 {
            if let user = user {
                UserRepository.save(user: user)
                contentView.setSuccessfulRegState()
            } else {
                contentView.setUndefinedErrorState()
            }
        } else {
            currentIndex += 1
            contentView.update(with: models[currentIndex], animated: true)
        }
    }
}

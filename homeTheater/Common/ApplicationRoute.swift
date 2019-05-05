//
//  ApplicationRoute.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/5/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit

protocol RegistrationPresentable where Self: UIViewController {
    func configure(with model: RegistrationRouteModel)
}

protocol HomeTheaterPresentable where Self: UIViewController {
    func set(user: User)
}

class ApplicationRoute {
    
    enum Route {
        case registrationFlow
        case forgotPassword
        case homeTheater(user: User)
    }
    
    private static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    static func get(_ path: Route) -> [UIViewController] {
        switch path {
        case .registrationFlow: return getRegistrationFlow()
        case .forgotPassword: return getForgotPassword()
        case .homeTheater(let user): return getHomeTheater(user: user)
        }
    }
}

private extension ApplicationRoute {
    
    static func getForgotPassword() -> [UIViewController] {
        fatalError("it have not been implemented yet.")
    }
    
    static func getHomeTheater(user: User) -> [UIViewController] {
        guard let controller = storyboard.instantiateViewController(
            withIdentifier: "HomeTheater") as? HomeTheaterPresentable else {
                fatalError()
        }
        controller.set(user: user)
        return [controller]
    }
    
    static func getRegistrationFlow() -> [UIViewController] {
        let models = [
            RegistrationRouteModel(title: "What is your name?", isPassword: false),
            RegistrationRouteModel(title: "Enter your email", isPassword: false),
            RegistrationRouteModel(title: "Please, come up with a password", isPassword: true)
        ]
        
        var controllers = [RegistrationPresentable]()
        models.forEach {
            guard let controller = storyboard.instantiateViewController(
                withIdentifier: "Registration") as? RegistrationPresentable else {
                    fatalError()
            }
            
            controller.configure(with: $0)
            controllers.append(controller)
        }
        
        return controllers
    }
}

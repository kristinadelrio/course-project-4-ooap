//
//  ApplicationRoute.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/5/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit

protocol HomeTheaterPresentable where Self: UIViewController {
    func set(user: User)
}

class ApplicationRoute {
    
    enum Route {
        case registration
        case forgotPassword
        case homeTheater(user: User)
    }
    
    private static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    static func get(_ path: Route) -> UIViewController {
        switch path {
        case .registration: return getRegistrationFlow()
        case .forgotPassword: return getForgotPassword()
        case .homeTheater(let user): return getHomeTheater(user: user)
        }
    }
}

private extension ApplicationRoute {
    
    static func getForgotPassword() -> UIViewController {
        fatalError("it have not been implemented yet.")
    }
    
    static func getHomeTheater(user: User) -> UIViewController {
        guard let controller = storyboard.instantiateViewController(
            withIdentifier: "HomeTheater") as? HomeTheaterPresentable else {
                fatalError()
        }
        controller.set(user: user)
        return controller
    }
    
    static func getRegistrationFlow() -> UIViewController {
        guard let controller = storyboard.instantiateViewController(
            withIdentifier: "Registration") as? RegisterationController else {
                fatalError()
        }
        return controller
    }
}

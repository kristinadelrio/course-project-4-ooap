//
//  UsersRepository.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/5/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import Foundation

class UserRepository {
    
    static private var users = [
        User(name: "Kris", email: "kalbrechet@gmail.com", password: "1234"),
        User(name: "Pablo", email: "pablo@gmail.com", password: "1234"),
        User(name: "Sergiy", email: "sergiy@gmail.com", password: "1234"),
        User(name: "Kristi", email: "kris", password: "1234"),
    ]
    
    static func getUser(by email: String) -> User? {
        return users.first(where: { $0.email == email })
    }
    
    static func save(user: User) {
        // TODO:
    }
}

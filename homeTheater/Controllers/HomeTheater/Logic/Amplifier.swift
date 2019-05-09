//
//  Amplifier.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/9/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import Foundation

typealias DVD = DvdPlayer
typealias CD = CdPlayer

class Amplifier {
    
    private var tuner: Tuner!
    private var dvd: DVD?
    private var cd: CD?
    
    func on() {}
    func off() {}
    func set(cd: CD) {}
    func set(dvd: DVD) {}
    func setStereoSound() {}
    func setSurroundSound() {}
    func set(tuner: Tuner) {}
    func set(volume: Int) {}
}

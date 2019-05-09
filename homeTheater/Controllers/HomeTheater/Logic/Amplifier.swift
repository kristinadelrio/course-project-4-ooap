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
    
    func on() {
        print("Amplifier on...")
    }
    
    func off() {
        print("Amplifier off...")
    }
    
    func set(cd: CD) {
        print("Amplifier setiing cd...")
    }
    
    func set(dvd: DVD) {
        print("Amplifier setting dvd...")
    }
    
    func setStereoSound() {
        print("Amplifier setting stereo sound...")
    }
    
    func setSurroundSound() {
        print("Amplifier setting surround sound...")
    }
    
    func set(tuner: Tuner) {
        print("Amplifier setting tunner...")
    }
    
    func set(volume: Int) {
        print("Amplifier setting volume...")
    }
}

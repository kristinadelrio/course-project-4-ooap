//
//  Tuner.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/9/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import Foundation

typealias AM = String
typealias FM = String
typealias Frequency = Double

class Tuner {
    
    func on() {
        print("Tunner on...")
    }
    func off() {
        print("Tunner off...")
    }
    
    func set(am: AM) {}
    func set(fm: FM) {}
    func set(frequency: Frequency) {}
}

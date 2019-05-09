//
//  CdPlayer.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/9/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import Foundation

class CdPlayer {
    
    func on() {
        print("CdPlayer on...")
    }
    func off() {
        print("CdPlayer off...")
    }
    func eject() {
        print("CdPlayer eject...")
    }
    func pause() {}
    func play(song: Song) {
        print("CdPlayer play song...")
    }
    func stop() {
        print("CdPlayer stop...")
    }
}

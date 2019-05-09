//
//  DvdPlayer.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/9/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import Foundation

class DvdPlayer {
    
    func on() {
        print("DvdPlayer on...")
    }
    
    func off() {print("DvdPlayer off...")}
    func eject() {print("DvdPlayer eject...")}
    func pause() {}
    func play(movie: Movie) {print("DvdPlayer play...")}
    func stop() {print("DvdPlayer stop...")}
    func setSurroundAudio() {print("DvdPlayer set surround audio...")}
    func setTwoChannelAudio() {print("DvdPlayer set two channel audio...")}
}

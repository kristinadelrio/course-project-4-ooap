//
//  HomeTheaterFacade.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/9/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import Foundation

typealias Movie = Content
typealias Song = Content

class HomeTheaterFacade {
    
    private var amp: Amplifier
    private var tuner: Tuner
    private var dvd: DvdPlayer
    private var cd: CdPlayer
    private var projector: Projector
    private var lights: TheaterLight
    private var screen: Screen
    private var poppper: PopcornPopper
    
    init(amp: Amplifier,
         tuner: Tuner,
         dvd: DvdPlayer,
         cd: CdPlayer,
         projector: Projector,
         lights: TheaterLight,
         screen: Screen,
         poppper: PopcornPopper) {
        
        self.amp = amp
        self.tuner = tuner
        self.dvd = dvd
        self.cd = cd
        self.projector = projector
        self.lights = lights
        self.screen = screen
        self.poppper = poppper
    }
    
    func watch(movie: Movie, completion: (() -> Void)?) {
        print("Getting ready to watching movie...")
        poppper.on()
        poppper.pop()
        lights.dim(10)
        screen.down()
        projector.on()
        amp.set(dvd: dvd)
        amp.setSurroundSound()
        amp.set(volume: 5)
        dvd.on()
        dvd.play(movie: movie)
        completion?()
    }
    
    func endMovie(completion: (() -> Void)?) {
        print("Shutting movie theater down...")
        poppper.off()
        lights.on()
        screen.up()
        projector.off()
        amp.off()
        dvd.stop()
        dvd.eject()
        dvd.off()
        completion?()
    }
    
    func listenToCd(song: Song, completion: (() -> Void)?) {
        amp.set(cd: cd)
        amp.setStereoSound()
        cd.on()
        cd.play(song: song)
        completion?()
        
    }
    
    func endCd() {
        amp.off()
        cd.eject()
        cd.off()
    }
}

//
//  ContentListPresenter.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/9/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import Foundation

protocol ContentViewProtocol: class {
    func showContent()
}

class ContentPresenter {
    
    private unowned let contentView: ContentViewProtocol
    private var isVideoContent: Bool
    private let theaterFacade = HomeTheaterFacade(amp: Amplifier(), tuner: Tuner(), dvd: DvdPlayer(), cd: CdPlayer(), projector: Projector(), lights: TheaterLight(), screen: Screen(), poppper: PopcornPopper())
    
    
    init(contentView: ContentViewProtocol, isVideoContent: Bool) {
        self.contentView = contentView
        self.isVideoContent = isVideoContent
    }
    
    func stop() {
        theaterFacade.endMovie(completion: nil)
    }
    
    func play(content: Content) {
        if isVideoContent {
            theaterFacade.watch(movie: content) { [weak self] in
                self?.contentView.showContent()
            }
        } else {
            theaterFacade.listenToCd(song: content) { [weak self] in
                self?.contentView.showContent()
            }
        }
    }
}

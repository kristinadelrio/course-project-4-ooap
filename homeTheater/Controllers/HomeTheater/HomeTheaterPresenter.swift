//
//  HomeTheaterPresenter.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/9/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import Foundation

protocol HomeTheaterContentView: class {
    
}

class HomeTheaterPresenter {
    
    private unowned let contentView: HomeTheaterContentView
    
    init(contentView: HomeTheaterContentView) {
        self.contentView = contentView
    }
    
    func onPlayMovie() {
        
    }
    
    func onListenToMusic() {
        
    }
}

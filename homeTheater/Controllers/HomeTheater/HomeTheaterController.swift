//
//  HomeTheaterController.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/9/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit

class HomeTheaterController: UIViewController, HomeTheaterContentView {

    @IBOutlet weak var movieButton: UIButton!
    @IBOutlet weak var musicButton: UIButton!
    
    private lazy var presenter: HomeTheaterPresenter = {
        return HomeTheaterPresenter(contentView: self)
    }()
    
    @IBAction func onListenToMusic(_ sender: Any) {
        performSegue(withIdentifier: "ShowMovies", sender: ["", "", ""])
    }
    
    @IBAction func onWatchMovie(_ sender: Any) {
        performSegue(withIdentifier: "ListenToMusic", sender: ["", "", ""])
    }
}

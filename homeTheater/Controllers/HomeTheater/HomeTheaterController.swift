//
//  HomeTheaterController.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/9/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit

class HomeTheaterController: UIViewController {

    @IBOutlet weak var movieButton: UIButton!
    @IBOutlet weak var musicButton: UIButton!
    
    private var user: User!
    
    func set(user: User) {
        self.user = user
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func onListenToMusic(_ sender: Any) {
        performSegue(withIdentifier: "ShowList", sender: false)
    }
    
    @IBAction func onWatchMovie(_ sender: Any) {
        performSegue(withIdentifier: "ShowList", sender: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ContentTableController {
            controller.isVideoContent = (sender as! Bool)
        }
    }
}

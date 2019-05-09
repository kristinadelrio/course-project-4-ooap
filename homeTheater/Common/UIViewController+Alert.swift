//
//  UIViewController+Alert.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/5/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(_ title: String = "Error",
                   with message: String,
                   completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            completion?()
        }))
        present(alert, animated: true)
    }
}

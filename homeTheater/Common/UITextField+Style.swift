//
//  UITextField+Style.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/5/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setBorder(with color: UIColor = UIColor.lightGray.withAlphaComponent(0.5)) {
        layer.borderColor = color.cgColor
        layer.cornerRadius = 5
        layer.borderWidth = 1
    }
    
    func clear() {
        text = ""
    }
}


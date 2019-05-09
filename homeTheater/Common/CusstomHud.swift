//
//  CusstomHud.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/9/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import MBProgressHUD

extension MBProgressHUD {
    
    class func showProgressHud(view: UIView, animated: Bool) -> MBProgressHUD {
        let progressHUD = MBProgressHUD.showAdded(to:view, animated: true)
        progressHUD.mode = MBProgressHUDMode.indeterminate
        progressHUD.bezelView.color = UIColor.clear
        progressHUD.bezelView.style = .solidColor
        progressHUD.contentColor = UIColor.black
        progressHUD.removeFromSuperViewOnHide = true
        return progressHUD
    }
    
    class func showAnimated(onView view: UIView?) {
        if let view = view {
            let _ = MBProgressHUD.showProgressHud(view: view, animated: true)
        }
    }
    
    class func hideAnimated(forView view: UIView?) {
        if let view = view {
            MBProgressHUD.hide(for: view, animated: true)
        }
    }
}

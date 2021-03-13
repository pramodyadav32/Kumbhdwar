//
//  AppDelegate.swift
//  Kumbhdwar
//
//  Created by Narender Kumar on 12/03/21.
//  Copyright © 2021 Narender Kumar. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window:UIWindow?
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    
    
    // MARK: - Root View Controller
    func presentRootViewController(_ animated: Bool = false) {
        if animated {
            let animation: CATransition = CATransition()
            animation.duration = CFTimeInterval(0.5)
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            animation.type = CATransitionType.moveIn
            animation.subtype = CATransitionSubtype.fromTop
            animation.fillMode = CAMediaTimingFillMode.forwards
            window?.layer.add(animation, forKey: "animation")
        }
        window?.rootViewController = rootViewController()
        // window?.rootViewController = testRootController()
    }
    
    fileprivate func rootViewController() -> UIViewController! {
        
        let sb = UIStoryboard(name: "User", bundle: nil)
        let mainVC = sb.instantiateInitialViewController()
        let navController = UINavigationController(rootViewController: mainVC!)
        navController.isNavigationBarHidden = true
        return navController
        
        //        if UserManager.shared.isUserLoggedIn() {
        //
        //        } else {
        //
        //        }
    }

}


extension AppDelegate {
    
    struct PushCategoryIdentifiers {
        static let NONE = "NONE"
        static let CUSTOMNOTIFICATION = "CUSTOMNOTIFICATION"
    }
    
}

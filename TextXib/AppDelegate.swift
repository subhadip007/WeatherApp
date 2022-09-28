//
//  AppDelegate.swift
//  TextXib
//
//  Created by Zaggle on 22/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
                
//                let attribute = "Sample"
//                let initialViewController = SampleViewController(veryImportantAttribute: attribute)
                
                navigationController = UINavigationController(rootViewController: rootViewController())
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
                return true
       
    }
}


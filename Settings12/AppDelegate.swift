//
//  AppDelegate.swift
//  Settings12
//
//  Created by Igor Kuzmin on 15.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let settingsNavigationController = UINavigationController(rootViewController: SettingsViewController())

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        settingsNavigationController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = settingsNavigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

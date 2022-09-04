//
//  AppDelegate.swift
//  Clients Checker
//
//  Created by Станислав on 24.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        
        coordinator = AppCoordinator(navigationController: navigationController)
        coordinator.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

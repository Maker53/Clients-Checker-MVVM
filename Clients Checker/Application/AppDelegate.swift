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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let clientListViewController = ClientListViewController()
        let navigationController = UINavigationController(rootViewController: clientListViewController)
        
        navigationController.navigationBar.prefersLargeTitles = true
        clientListViewController.title = "Список клиентов"
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

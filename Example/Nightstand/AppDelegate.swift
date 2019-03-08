//
//  AppDelegate.swift
//  Nightstand_Example
//
//  Created by Tyler Neveldine on 02/08/2019.
//

import UIKit
import Nightstand

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    
    private let rootNavigationController = UINavigationController()
    private lazy var appCoordinator = AppCoordinator(rootNavigationController: rootNavigationController)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
        
        appCoordinator.start()
        
        return true
    }
}

//
//  AppDelegate.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appDIContainer = AppDIContainer()
    var appRouterCoordinator: AppRouterCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        
        appRouterCoordinator = AppRouterCoordinator(navigationController: navigationController,
                                                    appDIContainer: appDIContainer)
        appRouterCoordinator?.start()
        window?.makeKeyAndVisible()
        
        return true
    }
}


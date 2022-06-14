//
//  AppRouterCoordinator.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import UIKit

final class AppRouterCoordinator {
    
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let gnomesSceneDIContainer = appDIContainer.makeGnomeSceneDIContainer()
        let router = gnomesSceneDIContainer.makeGnomesRouter(navigationController: navigationController)
        router.showGnomesList()
    }
}

//
//  GnomesRouter.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import UIKit

protocol GnomesRouter {
    func showGnomesList()
    func showGnomeDetail(gnome: Gnome)
    func closeGnomeDetail()
}

protocol GnomesRouterDependencies {
    func makeGnomesListViewController(actions: GnomesListViewActions) -> UIViewController
    func makeGnomeDetailViewController(gnome: Gnome, actions: GnomesDetailViewActions) -> UIViewController
}

class DefaultGnomesRouter: GnomesRouter {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: GnomesRouterDependencies
    
    init(navigationController: UINavigationController?,
         dependencies: GnomesRouterDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        
    }
    
    func showGnomesList() {
        let actions = GnomesListViewActions(showGnomeDetail: showGnomeDetail)
        let vc = dependencies.makeGnomesListViewController(actions: actions)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func showGnomeDetail(gnome: Gnome) {
        let actions = GnomesDetailViewActions(closeGnomeDetail: closeGnomeDetail)
        let vc = dependencies.makeGnomeDetailViewController(gnome: gnome, actions: actions)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func closeGnomeDetail() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

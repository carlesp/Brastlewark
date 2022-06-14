//
//  GnomesListViewController+Layout.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import UIKit

extension GnomesListViewController {
    func setUpUI() {
        setUpSubviews()
        setUpConstraints()
        setUpPropieties()
    }
    
    func setUpSubviews() {
        view.addSubviewWithAutolayout(tableView)
        navigationItem.titleView = searchBar
    }
    
    func setUpConstraints() {
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setUpPropieties() {
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
    }
}

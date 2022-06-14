//
//  GnomeDetailViewController+Layout.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 13/6/22.
//

import UIKit

extension GnomeDetailViewController {
    func setUpUI() {
        setUpSubviews()
        setUpConstraints()
    }
    
    func setUpSubviews() {
        view.addSubviewWithAutolayout(tableView)
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
}

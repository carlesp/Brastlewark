//
//  GnomeDetailViewController.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import UIKit

class GnomeDetailViewController: UIViewController {
    
    private var viewModel: GnomesDetailViewModel
    private var actions: GnomesDetailViewActions
    private var gnome: Gnome
    
    let tableView = UITableView()
    
    init(gnome: Gnome,
         viewModel: GnomesDetailViewModel,
         actions: GnomesDetailViewActions) {
        self.gnome = gnome
        self.actions = actions
        self.viewModel = viewModel
        
        self.viewModel.createTableViewItems(from: gnome)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpTableView()
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GnomeDetailHeaderView.self, forCellReuseIdentifier: GnomeDetailHeaderView.reuseIdentifier)
        tableView.register(GnomeDetailItemCell.self, forCellReuseIdentifier: GnomeDetailItemCell.reuseIdentifier)
        tableView.reloadData()
    }
}

extension GnomeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        switch viewModel.items[indexPath.row] {
        case .header(let gnome):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GnomeDetailHeaderView.reuseIdentifier, for: indexPath) as? GnomeDetailHeaderView else {
                assertionFailure("Cannot dequeue reusable cell \(GnomesListItemCell.self) with reuseIdentifier: \(GnomeDetailHeaderView.reuseIdentifier)")
                return UITableViewCell()
            }
            cell.configure(gnome: gnome, thumbnailUseCase: viewModel.gnomesThumbnailUseCase)
            return cell
        
        case .item(let cellVM):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GnomeDetailItemCell.reuseIdentifier, for: indexPath) as? GnomeDetailItemCell else {
                assertionFailure("Cannot dequeue reusable cell \(GnomeDetailItemCell.self) with reuseIdentifier: \(GnomeDetailItemCell.reuseIdentifier)")
                return UITableViewCell()
            }
            
            cell.configure(viewModel: cellVM)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if case .header = viewModel.items[indexPath.row] {
            return GnomeDetailHeaderView.height
        }
        return UITableView.automaticDimension
    }
}

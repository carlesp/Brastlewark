//
//  GnomesListViewController.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import UIKit

class GnomesListViewController: UIViewController {
    
    private var viewModel: GnomesListViewModel
    private var actions: GnomesListViewActions
    
    let tableView = UITableView()
    let searchBar = UISearchBar()
    
    init(viewModel: GnomesListViewModel,
         actions: GnomesListViewActions) {
        self.actions = actions
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpDelegates()
        setUpRegisterCells()
        
        viewModel.getGnomesList(completion: { [weak self] result in
            guard let strongSelf = self else { return }
            if case .failure(let error) = result {
                print(error.localizedDescription)
            } else {
                strongSelf.tableView.reloadData()
            }
        })
    }
    
    private func setUpDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    private func setUpRegisterCells() {
        tableView.register(GnomesListItemCell.self, forCellReuseIdentifier: GnomesListItemCell.reuseIdentifier)
    }
}

extension GnomesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredGnomeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GnomesListItemCell.reuseIdentifier, for: indexPath) as? GnomesListItemCell else {
            assertionFailure("Cannot dequeue reusable cell \(GnomesListItemCell.self) with reuseIdentifier: \(GnomesListItemCell.reuseIdentifier)")
            return UITableViewCell()
        }
        
     
        cell.configure(with: viewModel.filteredGnomeList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return GnomesListItemCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gnome = viewModel.filteredGnomeList[indexPath.row]
        actions.showGnomeDetail(gnome)
    }
}

extension GnomesListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        viewModel.filterGnomeList(string: textSearched)
        tableView.reloadData()
    }
}

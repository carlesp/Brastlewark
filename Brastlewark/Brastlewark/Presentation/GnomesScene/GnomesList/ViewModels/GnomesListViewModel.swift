//
//  GnomesListViewModel.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

struct GnomesListViewActions {
    let showGnomeDetail: (Gnome) -> Void
}

class GnomesListViewModel {
    
    private let getGnomesUseCase: GetGnomesUseCase
    
    private (set) var gnomeList: [Gnome] = [] {
        didSet {
            filteredGnomeList = gnomeList
        }
    }
    private (set) var filteredGnomeList: [Gnome] = []
    
    init(getGnomesUseCase: GetGnomesUseCase) {
        self.getGnomesUseCase = getGnomesUseCase
    }
    
    public func getGnomesList(completion: @escaping (Result<[Gnome], Error>) -> Void) {
        _ = getGnomesUseCase.execute(completion: { result in
            if case .success(let gnomes) = result {
                self.gnomeList = gnomes
            } else {
                self.gnomeList.removeAll()
            }
            completion(result)
        })
    }
    
    public func filterGnomeList(string: String) {
        if string.isEmpty {
            filteredGnomeList = gnomeList
        } else {
            filteredGnomeList = gnomeList.filter({ $0.name.contains(string) })
        }
    }
}

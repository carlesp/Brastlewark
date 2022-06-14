//
//  GnomeDetailViewModel.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

struct GnomesDetailViewActions {
    let closeGnomeDetail: () -> Void
}

enum GnomesDetailCells {
    case header(Gnome)
    case item(GnomeDetailItemCellViewModel)
}

class GnomesDetailViewModel {
    
    var items = [GnomesDetailCells]()
    let gnomesThumbnailUseCase: GetGnomesThumbnailUseCase
    
    init(gnomesThumbnailUseCase: GetGnomesThumbnailUseCase) {
        self.gnomesThumbnailUseCase = gnomesThumbnailUseCase
    }
    
    func createTableViewItems(from gnome: Gnome) {
        items.append(.header(gnome))
        items.append(.item(GnomeDetailItemCellViewModel(titleText: "Name", descriptionText: gnome.name)))
        items.append(.item(GnomeDetailItemCellViewModel(titleText: "Age", descriptionText: String(gnome.age))))
        items.append(.item(GnomeDetailItemCellViewModel(titleText: "Weight", descriptionText: String(gnome.weight))))
        items.append(.item(GnomeDetailItemCellViewModel(titleText: "Height", descriptionText: String(gnome.height))))
        items.append(.item(GnomeDetailItemCellViewModel(titleText: "Hair Color", descriptionText: gnome.hairColor)))
        items.append(.item(GnomeDetailItemCellViewModel(titleText: "Professions", descriptionText: getProfessionsText(from: gnome))))
        items.append(.item(GnomeDetailItemCellViewModel(titleText: "Friends", descriptionText: getFriendsText(from: gnome))))
    }
}

extension GnomesDetailViewModel {
    private func getProfessionsText(from gnome: Gnome) -> String {
        return gnome.professions?.joined(separator: ", ") ?? "Gnome doesn't have any profession"
    }
    
    private func getFriendsText(from gnome: Gnome) -> String {
        return gnome.friends?.joined(separator: ", ") ?? "Gnome doesn't have any friend"
    }
}

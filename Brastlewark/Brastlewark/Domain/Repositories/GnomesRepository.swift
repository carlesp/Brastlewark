//
//  GnomesRepository.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

protocol GnomesRepository {
    func getGnomes(completion: @escaping (Result<[Gnome], Error>) -> Void) -> Cancellable?
}

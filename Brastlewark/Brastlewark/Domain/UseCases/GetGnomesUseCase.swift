//
//  GetGnomesUseCase.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

protocol GetGnomesUseCase {
    func execute(completion: @escaping(Result<[Gnome], Error>) -> Void) -> Cancellable?
}


final class DefaultGetGnomesUseCase: GetGnomesUseCase {
    
    private let gnomesRepository: GnomesRepository
    
    init(gnomesRepository: GnomesRepository) {
        self.gnomesRepository = gnomesRepository
    }
    
    func execute(completion: @escaping (Result<[Gnome], Error>) -> Void) -> Cancellable? {
        return gnomesRepository.getGnomes(completion: completion)
    }
}

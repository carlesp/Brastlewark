//
//  DefaultGnomesRepository.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

final class DefaultGnomesRepository {
    private let apiMananger: ApiManager
    
    public init(apiMananger: ApiManager) {
        self.apiMananger = apiMananger
    }
}

extension DefaultGnomesRepository: GnomesRepository {
    func getGnomes(completion: @escaping (Result<[Gnome], Error>) -> Void) -> Cancellable? {
        apiMananger.getGnomes(completion: { result in
            switch result {
            case .success(let response):
                let map = GnomeMapper.map(input: response.data)
                completion(.success(map))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}

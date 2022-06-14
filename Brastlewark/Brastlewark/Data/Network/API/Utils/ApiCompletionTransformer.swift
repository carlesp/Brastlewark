//
//  ApiCompletionTransformer.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

class ApiCompletionTransformer {
    typealias NetworkServiceInternalCompletion = (Result<Data, NetworkError>) -> Void
    
    static func mapJsonDecoder<T: Decodable>(_ completion: @escaping (Result<T, Error>) -> Void) -> NetworkServiceInternalCompletion {
        return { result in
            switch result {
            case .success(let data):
                do {
                    let decodedResponse = try JSONDecoder().decode (T.self, from: data)
                    completion(.success(decodedResponse))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
                return
            }
        }
    }
}

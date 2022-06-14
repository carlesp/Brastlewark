//
//  NetworkService.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

public enum NetworkError: Error {
    case error(statusCode: Int, data: Data?)
    case urlGeneration
    case generic(Error)
    case noResponse
}

public protocol NetworkCancellable {
    func cancel()
}

extension URLSessionTask: NetworkCancellable { }

public final class NetworkService {
    
    typealias CompletionHandler = (Result<Data, NetworkError>) -> Void
    
    private let config: NetworkConfiguration
    
    public init(config: NetworkConfiguration) {
        self.config = config
    }
    
    func request(endpoint: Requestable, completion: @escaping CompletionHandler) -> NetworkCancellable? {
        do {
            let url = try endpoint.urlRequest(networkConfig: config)
            let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                if let error = error {
                    if let response = response as? HTTPURLResponse {
                        completion(.failure(.error(statusCode: response.statusCode, data: data)))
                    } else {
                        completion(.failure(.generic(error)))
                    }
                } else {
                    guard let data = data else { completion(.failure(.noResponse)); return }
                    DispatchQueue.main.async { return completion(.success(data)) }
                }
            })
            task.resume()
            return task
        } catch {
            completion(.failure(.urlGeneration))
            return nil
        }
    }
}


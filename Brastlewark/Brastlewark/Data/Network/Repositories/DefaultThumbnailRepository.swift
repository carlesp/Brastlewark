//
//  DefaultThumbnailRepository.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 13/6/22.
//

import Foundation

final class DefaultThumbnailRepository {
    private let networkService: NetworkService
    
    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension DefaultThumbnailRepository: ThumbnailRepository {
    func getThumbnail(url: String, completion: @escaping(Result<Data, Error>) -> Void) -> Cancellable? {
        let task = NetworkTask()
        task.networkTask = networkService.request(endpoint: Endpoint(path: url,
                                                  method: .get),
                               completion: { result in
            let result = result.mapError { $0 as Error }
            completion(result)
        })
        return task
    }
}

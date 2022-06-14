//
//  GetGnomesThumbnailUseCase.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 13/6/22.
//

import Foundation

protocol GetGnomesThumbnailUseCase {
    func execute(url: URL, completion: @escaping(Result<Data, Error>) -> Void) -> Cancellable?
}


final class DefaultGetGnomesThumbnailUseCase: GetGnomesThumbnailUseCase {
    
    private let thumbnailRepository: ThumbnailRepository
    private let fileCacheStorage: FileCacheStorage
    
    init(thumbnailRepository: ThumbnailRepository, fileCacheStorage: FileCacheStorage) {
        self.thumbnailRepository = thumbnailRepository
        self.fileCacheStorage = fileCacheStorage
    }
    
    func execute(url: URL, completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable? {
        if let data = try? fileCacheStorage.read(name: url.lastPathComponent) {
            completion(.success(data))
            return nil  
        } else {
            return thumbnailRepository.getThumbnail(url: url.absoluteString) { result in
                if case .success(let data) = result {
                    do {
                        try self.fileCacheStorage.save(data: data, name: url.lastPathComponent)
                    } catch let error {
                        completion(.failure(error))
                    }
                }
                completion(result)
            }
        }
    }
}

//
//  ApiManager.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

protocol ApiManager {
    func getGnomes(completion: @escaping(Result<ResponseTO<[GnomesTO]>, Error>) -> Void) -> Cancellable?
}

final class DefaultApiManager {
    private let provider: NetworkService
    
    init(provider: NetworkService) {
        self.provider = provider
    }
}

extension DefaultApiManager: ApiManager {
    func getGnomes(completion: @escaping (Result<ResponseTO<[GnomesTO]>, Error>) -> Void) -> Cancellable? {
        let task = NetworkTask()
        task.networkTask = provider.request(endpoint: APIEndpoints.getGnomes(),
                                            completion: ApiCompletionTransformer.mapJsonDecoder(completion))
        return task
    }
}

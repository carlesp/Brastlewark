//
//  MockApiMananger.swift
//  BrastlewarkTests
//
//  Created by Carles Garcia Puigardeu on 14/6/22.
//

import XCTest

@testable import Brastlewark

struct MockApiManager: ApiManager {
    
    var getGnomes: ResultMethodStub<ResponseTO<[GnomesTO]>> = ResultMethodStub()
    
    func getGnomes(completion: @escaping (Result<ResponseTO<[GnomesTO]>, Error>) -> Void) -> Cancellable? {
        getGnomes.doCall()
        completion(getGnomes.result)
        return nil
    }
}

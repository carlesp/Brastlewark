//
//  APIEndpoints.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

struct APIEndpoints {
    static func getGnomes() -> Endpoint {
        return Endpoint(path: "data.json",
                        method: .get)
    }
}

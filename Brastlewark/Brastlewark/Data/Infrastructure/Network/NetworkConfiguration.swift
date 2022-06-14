//
//  NetworkConfiguration.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

public struct NetworkConfiguration {
    public let baseURL: URL?
    
    public init(baseURL: URL?) {
        self.baseURL = baseURL
    }
}

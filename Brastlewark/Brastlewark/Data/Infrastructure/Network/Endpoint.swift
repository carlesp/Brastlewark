//
//  Endpoint.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

public enum HTTPMethod: String {
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

public protocol Requestable {
    var path: String { get }
    var method: HTTPMethod { get }
    
    func urlRequest(networkConfig: NetworkConfiguration) throws -> URLRequest
}

public struct Endpoint: Requestable {
    public let path: String
    public let method: HTTPMethod
    
    init(path: String,
         method: HTTPMethod) {
        self.path = path
        self.method = method
    }
}

extension Requestable {
    public func urlRequest(networkConfig: NetworkConfiguration) throws -> URLRequest {
        let baseURL = networkConfig.baseURL?.absoluteString ?? ""
        let endpoint = baseURL.appending(path)
        
        guard let url = URL(string: endpoint) else { throw NetworkError.urlGeneration }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}

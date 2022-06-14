//
//  ResponseTO.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

struct ResponseTO<T: Decodable>: Decodable {
    var data: T!
    
    enum CodingKeys: String, CodingKey {
       case data = "Brastlewark"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decode(T.self, forKey: .data)
    }
}

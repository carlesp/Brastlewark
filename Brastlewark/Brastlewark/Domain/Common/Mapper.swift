//
//  Mapper.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

public protocol Mapper {
    associatedtype Input
    associatedtype Output
    
    static func map(input: Input) -> Output
}

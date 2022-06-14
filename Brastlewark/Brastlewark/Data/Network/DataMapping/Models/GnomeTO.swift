//
//  GnomesTO.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

public struct GnomesTO: Decodable {
    let id: Int
    let name: String
    let thumbnail: String
    let age: Int
    let weight: Double
    let height: Double
    let hair_color: String
    let professions: [String]?
    let friends: [String]?
}

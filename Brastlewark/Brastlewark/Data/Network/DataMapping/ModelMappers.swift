//
//  ModelMappers.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

public struct GnomeMapper: Mapper {
    public static func map(input: [GnomesTO]) -> [Gnome] {
        return input.map({ countK -> Gnome in
            Gnome(id: countK.id,
                  name: countK.name,
                  thumbnail: countK.thumbnail,
                  age: countK.age,
                  weight: countK.weight,
                  height: countK.height,
                  hairColor: countK.hair_color,
                  professions: countK.professions,
                  friends: countK.friends)
        })
    }
}

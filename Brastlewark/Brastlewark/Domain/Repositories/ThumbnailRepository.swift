//
//  ThumbnailRepository.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 13/6/22.
//

import Foundation

protocol ThumbnailRepository {
    func getThumbnail(url: String, completion: @escaping(Result<Data, Error>) -> Void) -> Cancellable?
}

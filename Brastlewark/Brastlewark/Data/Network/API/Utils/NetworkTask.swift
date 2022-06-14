//
//  NetworkTask.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

class NetworkTask: Cancellable {
    var networkTask: NetworkCancellable?
    
    func cancel() {
        networkTask?.cancel()
    }
}

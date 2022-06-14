//
//  FileCacheStorage.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 13/6/22.
//

import Foundation

protocol FileCacheStorage {
    func read(name: String) throws -> Data?
    func save(data: Data, name: String) throws
}

class DefaultFileCacheStorage: FileCacheStorage {
    
    let ioQueue = DispatchQueue(label: "FileCacheStorageProcessQueue")
    let fileManager = FileManager()
    
    func read(name: String) throws -> Data? {
        let folderURL = self.fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
        let fileURL = folderURL[0].appendingPathComponent(name + ".cache")
        return try? Data(contentsOf: fileURL)
    }
    
    func save(data: Data, name: String) throws {
        ioQueue.async {
            do {
                let folderURL = self.fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
                let fileURL = folderURL[0].appendingPathComponent(name + ".cache")
                try data.write(to: fileURL)
            } catch _ { }
        }
    }
}

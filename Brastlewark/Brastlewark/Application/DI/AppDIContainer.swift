//
//  AppDIContainer.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation

final class AppDIContainer {
    
    lazy var apiNetworkService: NetworkService = {
        let config = NetworkConfiguration(baseURL: URL(string: AppConfigurations.apiBaseURL)!)
        return NetworkService(config: config)
    }()
    
    lazy var imageNetworkService: NetworkService = {
        let config = NetworkConfiguration(baseURL: nil)
        return NetworkService(config: config)
    }()
    
    // Scenes
    func makeGnomeSceneDIContainer() -> GnomesSceneDIContainer {
        return GnomesSceneDIContainer(apiNetworkService: apiNetworkService, imageNetworkService: imageNetworkService)
    }
}

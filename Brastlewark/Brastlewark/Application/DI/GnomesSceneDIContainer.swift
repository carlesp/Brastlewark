//
//  GnomesSceneDIContainer.swift
//  Brastlewark
//
//  Created by Carles Garcia Puigardeu on 9/6/22.
//

import Foundation
import UIKit

final class GnomesSceneDIContainer {
    let apiNetworkService: NetworkService
    let imageNetworkService: NetworkService
    
    init(apiNetworkService: NetworkService, imageNetworkService: NetworkService) {
        self.apiNetworkService = apiNetworkService
        self.imageNetworkService = imageNetworkService
    }
    
    
    // ApiManager
    func makeApiManager() -> ApiManager {
        return DefaultApiManager(provider: apiNetworkService)
    }
    
    
    // Repositories
    func makeGnomesRepository() -> GnomesRepository {
        return DefaultGnomesRepository(apiMananger: makeApiManager())
    }
    
    func makeThumbnailRepository() -> ThumbnailRepository {
        return DefaultThumbnailRepository(networkService: imageNetworkService)
    }
    
    
    
    // UseCases
    func makeGetGnomesUseCase() -> GetGnomesUseCase {
        return DefaultGetGnomesUseCase(gnomesRepository: makeGnomesRepository())
    }
    
    func makeGetGnomesThumbnailUseCase() -> GetGnomesThumbnailUseCase {
        return DefaultGetGnomesThumbnailUseCase(thumbnailRepository: makeThumbnailRepository(),
                                                fileCacheStorage: DefaultFileCacheStorage())
    }
    
    // Routes
    func makeGnomesRouter(navigationController: UINavigationController) -> GnomesRouter {
        return DefaultGnomesRouter(navigationController: navigationController,
                                   dependencies: self)
    }
    
    
    // Gnomes List
    func makeGnomesListViewController(actions: GnomesListViewActions) -> UIViewController {
        return GnomesListViewController(viewModel: makeGnomesListViewModel(),
                                        actions: actions)
    }
    
    func makeGnomesListViewModel() -> GnomesListViewModel {
        return GnomesListViewModel(getGnomesUseCase: makeGetGnomesUseCase())
    }
    
    
    // Gnome Detail
    func makeGnomeDetailViewController(gnome: Gnome,
                                       actions: GnomesDetailViewActions) -> UIViewController {
        return GnomeDetailViewController(gnome: gnome,
                                         viewModel: makeGnomesDetailViewModel(),
                                         actions: actions)
    }
    
    func makeGnomesDetailViewModel() -> GnomesDetailViewModel {
        return GnomesDetailViewModel(gnomesThumbnailUseCase: makeGetGnomesThumbnailUseCase())
    }
    
}

extension GnomesSceneDIContainer: GnomesRouterDependencies { }

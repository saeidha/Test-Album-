//
//  PhotoSceneConfigurator.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import Foundation
protocol PhotoSceneConfiguration {
    /// Configuare Photo Scens View Controller
    func configured(_ vc: PhotoSceneViewController, dataSource: PhotoModel.Fetch.ViewModel) -> PhotoSceneViewController
}

final class PhotoSceneConfigurator: PhotoSceneConfiguration {
    
    // MARK: - PhotoScene Configurator
    func configured(_ vc: PhotoSceneViewController, dataSource: PhotoModel.Fetch.ViewModel) -> PhotoSceneViewController {
        
        // VIP Architect setup
        let worker = PhotoWorker()
        let interactor = PhotoInteractor()
        let presenter = PhotoPresenter()
        let router = PhotoSceneRouter()
        router.source = vc
        vc.interactor = interactor
        vc.router = router
        presenter.viewController = vc
        interactor.presenter = presenter
        interactor.worker = worker
        interactor.dataStore = dataSource
        
        return vc
    }
}

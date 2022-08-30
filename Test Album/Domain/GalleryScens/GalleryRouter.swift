//
//  GalleryRouter.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit

protocol GallerySceneRoutingLogic {
    /// show Photo
    func showPhoto(viewModel: PhotoModel.Fetch.ViewModel)
    /// show load failure and try again
    func showLoadFailure(message: String)
}

final class GallerySceneRouter{
    
    // MARK: - Public Property
    var source: GallerySceneViewController?
    var dataSource: PhotoModel.Fetch.ViewModel?
    weak var viewController: GallerySceneViewController?
    
}

extension GallerySceneRouter: GallerySceneRoutingLogic {
    
    // MARK: - GalleryScene routing logic
    func showPhoto(viewModel: PhotoModel.Fetch.ViewModel) {
    }
    
    func showLoadFailure(message: String) {
    }
}

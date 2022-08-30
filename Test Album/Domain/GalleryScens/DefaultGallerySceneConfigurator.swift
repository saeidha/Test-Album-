//
//  DefaultGallerySceneConfigurator.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import Foundation

protocol GallerySceneConfigurator {
    /// Configuare Gallery Scens View Controller
    func configured(_ vc: GallerySceneViewController) -> GallerySceneViewController
}

final class DefaultGallerySceneConfigurator: GallerySceneConfigurator {
    
    // MARK: - Public Methods
    func configured(_ vc: GallerySceneViewController) -> GallerySceneViewController {
        
     return vc
    }
}

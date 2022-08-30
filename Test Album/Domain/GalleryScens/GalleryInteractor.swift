//
//  GalleryInteractor.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import Foundation

protocol GalleryInteractorBusinessLogic {
    /// Load Gallery
    func loadGallery()
    /// Reload Gallery
    func reloadGallery()
    /// Show Photo
    func showPhoto()
}

class GalleryInteractor {
    
    // MARK: - Public Property
    var presenter: GalleryPresentationBusinessLogic?
}

extension GalleryInteractor: GalleryInteractorBusinessLogic {
    
    
    // MARK: - Interactor logic
    func showPhoto() {
    }
    
    func loadGallery() {
    }
    
    func reloadGallery() {
    }
    
    // MARK: - Private Methods
    /// Reload Gallery Network Call
    fileprivate func loadGalleryNetworkCall(){
        
    }
}


//
//  PhotoPresenter.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit

protocol PhotoPresentationLogic
{
    /// Fetch Image
    func presentImageResult(image: UIImage?, error: Error?)
    /// Fetch Title
    func presentTitle(title: String)
}

class PhotoPresenter
{
    // MARK: - Public Property
    weak var viewController: PhotoSceneInput?
}

extension PhotoPresenter: PhotoPresentationLogic
{
    
    // MARK: - Presentation logic
    /// present Image from network or cache
    func presentImageResult(image: UIImage?, error: Error?) {
        if let error = error {
            viewController?.errorFetchingPhoto(error: error.localizedDescription)
        }
        if let image = image{
            viewController?.successFetchedPhoto(image: image)
        }
    }
    
    /// Set title
    func presentTitle(title: String) {
        viewController?.fetchTitle(title: title)
    }
}


//
//  GalleryPresenter.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import Foundation

protocol GalleryPresentationBusinessLogic
{
    /// Fetch Result and Show Items
    func presentFetchResults(response: [PhotoModel.Fetch.Response]?, error: Error?)
}

class GalleryPresenter
{
    // MARK: - Public Property
    weak var viewController: GallerySceneInput?
}

extension GalleryPresenter: GalleryPresentationBusinessLogic{
    
    // MARK: - Presentation logic
    func presentFetchResults(response: [PhotoModel.Fetch.Response]?, error: Error?) {
    }
}

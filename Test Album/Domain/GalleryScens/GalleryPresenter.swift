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
    func presentFetchResults()
}

class GalleryPresenter
{
    // MARK: - Public Property
    weak var viewController: GalleryScenceInput?
}

extension GalleryPresenter: GalleryPresentationBusinessLogic{
    
    // MARK: - Presentation logic
    func presentFetchResults() {
    }
}

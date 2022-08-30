//
//  PhotoInteractor.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import Foundation

protocol PhotoBusinessLogic {
    /// Set title from date view model
    func setTitle()
    /// Reload Photo
    func reloadPhoto()
    /// Show photo from coredata or network call
    func showPhoto()
}

class PhotoInteractor {
    
    // MARK: - Public Property
    var worker: PhotoWorker?
    var dataStore: PhotoModel.Fetch.ViewModel?
    var presenter: PhotoPresentationLogic?
}

extension PhotoInteractor: PhotoBusinessLogic {
    
    // MARK: - Interactor logic
    /// Show photo from coredata or network call
    func showPhoto() {
        guard let dataStore = dataStore, let downloadUrl = dataStore.downloadUrl else {return}
        worker?.getImage(downloadUrl, completionhandler: { image, error in
            self.presenter?.presentImageResult(image: image, error: error)
        })
    }
    
    /// Set date as title from view model
    func setTitle(){
        guard let dataStore = dataStore, let createdAt = dataStore.createdAt else {return}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:createdAt)!
        
        dateFormatter.dateFormat = "YY/MM/dd hh:mm"
        
        presenter?.presentTitle(title: dateFormatter.string(from: date))
    }
    
    /// Reload Photo Network Call
    func reloadPhoto() {
        guard let dataStore = dataStore, let downloadUrl = dataStore.downloadUrl else { return }
        DispatchQueue.main.async {
            self.worker?.getImage(downloadUrl, completionhandler: { image, error in
                self.presenter?.presentImageResult(image: image, error: error)
            })
        }
    }
}


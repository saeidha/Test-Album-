//
//  PhotoWorker.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import Foundation

class PhotoWorker{

    // MARK: - Public Methods
    /// fetch image from cache or download it
    func getImage(_ image: String, completionhandler:@escaping(responseImageHandler)){
        guard let imageURL = URL(string: image) else {return}
            NetworkManager.shared.load(url: imageURL) { image, error in
                completionhandler(image,error)
            }
    }
}

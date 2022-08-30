//
//  PhotoRouter.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit

protocol PhotoSceneRoutingLogic {
    /// show load failure and try again
    func showLoadFailure(message: String)
}

final class PhotoSceneRouter
{
        
    // MARK: - Public Property
    weak var source: PhotoSceneViewController?
}

extension PhotoSceneRouter: PhotoSceneRoutingLogic {
    
    // MARK: - GalleryScene routing logic
    /// Show alert for failure fetch condition
    func showLoadFailure(message: String) {
        let alert = UIAlertController(title: message, message: "Plase try agian", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
            alert.dismiss(animated: true)
        })
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { (action:UIAlertAction!) in
            self.source?.reload()
            
        }))
        source?.present(alert, animated: true)
    }
}

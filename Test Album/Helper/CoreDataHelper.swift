//
//  CoreDataHelper.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit

/// This is our core data class, it will handle all iteraction with core data
class CoreDataHelper{
    
    // MARK: - Public Property
    static let shared = CoreDataHelper()
    
    // MARK: - Private Property
    fileprivate let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Public Method
    /// fetch photo model with core data
    func fetchData(completion: @escaping (_ model: [PhotoModel.Fetch.ViewModel]?, _ error: Bool) -> Void){
        
        do {
            var viewModels = [PhotoModel.Fetch.ViewModel]()
            let items = try context.fetch(PhotoEntity.fetchRequest())
            for item in items {
                viewModels.append(PhotoModel.Fetch.ViewModel(id: item.id, filename: item.filename, createdAt: item.createdAt, thumbnailUrl: item.thumbnailUrl, downloadUrl: item.downloadUrl))
            }
            
            completion(viewModels, false)
        }catch{
            completion(nil, false)
        }
    }
    
    /// delete all photo and add new photo model in persistence database
    func syncData(response: [PhotoModel.Fetch.Response]?){
        guard let response = response else {return}
        
        let items = try? context.fetch(PhotoEntity.fetchRequest())
        guard let items = items else {return}
        for item in items {
            context.delete(item)
        }
        try? context.save()
        
        for item in response {
            let photo = PhotoEntity(context: context)
            photo.id = item.id
            photo.filename = item.filename
            photo.size = Int32(item.size ?? 0)
            photo.createdAt = item.createdAt
            photo.thumbnailUrl = item.thumbnailUrl
            photo.downloadUrl = item.downloadUrl
            
            try? context.save()
        }
        
    }
}

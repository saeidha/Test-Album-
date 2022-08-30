//
//  Photo.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import Foundation

struct PhotoModel: Codable {
    
    // Fetch request
    struct Fetch {
        
        // Response Model
        struct Response: Codable {
            let id: String?
            let userId: String?
            let mediaType: String?
            let filename: String?
            let size: Int?
            let createdAt:  String?
            let contentType: String?
            let thumbnailUrl: String?
            let downloadUrl:  String?
            let resx: Int?
            let resy: Int?
            
            // Enum for Decodable keys
            enum CodingKeys: String, CodingKey{
                case id, filename,size
                case userId = "user_id"
                case mediaType = "media_type"
                case createdAt = "created_at"
                case contentType = "content_type"
                case thumbnailUrl = "thumbnail_url"
                case downloadUrl = "download_url"
                case resx = "resx"
                case resy = "resy"
            }
        }
        
        // View Model
        struct ViewModel {
            let id: String?
            let filename: String?
            let createdAt:  String?
            let thumbnailUrl: String?
            let downloadUrl:  String?
        }
    }
}

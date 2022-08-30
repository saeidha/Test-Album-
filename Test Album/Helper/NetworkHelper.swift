//
//  NetworkHelper.swift
//  Test Album
//
//  Created by saeid on 8/30/22.
//

import UIKit

/// Network error handler
enum ManagerErrors: Error {
    case invalidResponse
    case invalidStatusCode(Int)
    case networkNotReachable
    case couldNotParseData
    
    // description for network error
    var description: String{
        switch self{
        case .invalidResponse:
            return "Newtok not reachable"
        case .invalidStatusCode(let status):
            return "A Server error with status Code \(status)"
        case .networkNotReachable:
            return "Netwok not reachable"
        case .couldNotParseData:
            return "Could not parse data"
        }
    }
}

/// This is our network class, it will handle all requests
class NetworkManager {
    
    // MARK: - Public Property
    static let shared = NetworkManager()

    /// Request methods
    enum HttpMethod: String {
        case get
        case post
        
        var method: String { rawValue.uppercased() }
    }
    
    // MARK: - Public Method
    /// Network API Request
    func request<T: Decodable>(fromURL url: URL, httpMethod: HttpMethod = .get, completion: @escaping (Result<T, ManagerErrors>) -> Void) {
        
        let completionOnMain: (Result<T, ManagerErrors>) -> Void = { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        
        // Create the request. On the request you can define if it is a GET or POST request, add body and more.
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.method
        
        let urlSession = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Handle server or network error
            if let _ = error {
                completionOnMain(.failure(ManagerErrors.networkNotReachable))
                return
            }
            
            // Handle server or network error
            guard let urlResponse = response as? HTTPURLResponse else { return completionOnMain(.failure(ManagerErrors.invalidResponse)) }
            if !(200..<300).contains(urlResponse.statusCode) {
                return completionOnMain(.failure(ManagerErrors.invalidStatusCode(urlResponse.statusCode)))
            }
            
            guard let data = data else { return }
            do {
                let users = try JSONDecoder().decode(T.self, from: data)
                completionOnMain(.success(users))
            } catch {
                completionOnMain(.failure(.couldNotParseData))
            }
        }
        
        urlSession.resume()
    }
    
    // Image downloader and cache request
    func load(url: URL, cache: URLCache? = nil, completion: @escaping (UIImage?, Error?) -> Void) {
        let cache = cache ?? URLCache.shared
        let request = URLRequest(url: url)
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            // Return image that exist in cache
            completion(image,nil)
        } else {
            
            // Return image and save in cache
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    completion(image,nil)
                }
            }).resume()
        }
    }
    
    /// remove all cache data
    func removeCache(){
        URLCache.shared.removeAllCachedResponses()
    }
    
}


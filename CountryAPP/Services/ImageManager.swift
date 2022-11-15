//
//  ImageManager.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 15.11.2022.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String) -> Data? {
        
        guard let url = URL(string: url) else { return nil}
        
        if let cachedData = getDataFromCache(from: url) {
            return cachedData
        }
        
        return loadDataFromNetwork(from: url)
    }
        
    
private func loadDataFromNetwork(from url: URL) -> Data? {
    var dataImage: Data!
    
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response =  response else {
                print(error?.localizedDescription ?? "Error load")
                return
            }
            
            guard url == response.url else { return }
            dataImage = data
            self.setDataToCache(with: data, response: response)
        }
    return dataImage
    }
    
    private func getDataFromCache(from url: URL) -> Data? {
        let urlRequest = URLRequest(url: url)
        if let cacheResponse = URLCache.shared.cachedResponse(for: urlRequest) {
            return cacheResponse.data
        }
        return nil
    }
    
    private func setDataToCache(with data: Data, response: URLResponse) {
        guard let url = response.url else { return }
        let urlRequest = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }
}

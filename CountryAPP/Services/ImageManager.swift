//
//  ImageManager.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 15.11.2022.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    private lazy var cache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject,AnyObject>()
        return cache
    }()
    
    private init() {}
    
    func fetchImage(from url: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: url) else { return }
   // Получение данных из Кэша
//        if let cachedData = getDataFromCache(from: url) {
//            completion(cachedData)
//            print("Выгружено из кэша")
//            return
//        }
    // Получение данных из UserDefaults
        if let cachedData = getDataFromUSerDefaults(from: url) {
            completion(cachedData)
            print("Выгружено из UserDefaults")
            return
        }
        
        print("Загружено из сети")
        loadDataFromNetwork(from: url) { data in completion(data) }
    }
    
    
    private func loadDataFromNetwork(from url: URL, completion: @escaping (Data) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data {
                completion(data)
//                self.setDataToCache(with: data, key: url)
                self.setDataToUserDefault(with: data, key: url)
            }
        }.resume()
    }
    
// Кэширование через NSCache
    private func getDataFromCache(from url: URL) -> Data? {
        if let cacheData = cache.object(forKey: url as AnyObject), cacheData as? Data != nil {
            return cacheData as? Data
        }
        return nil
    }
    
    private func setDataToCache(with data: Data, key: URL) {
        cache.setObject(data as AnyObject, forKey: key as AnyObject)
        print("Сохранено в кэш")
    }
// Кэширование через UserDefaults
    private func getDataFromUSerDefaults(from url: URL) -> Data? {
        if let cacheData = UserDefaults.standard.object(forKey: url.description), cacheData as? Data != nil {
            return cacheData as? Data
        }
        return nil
    }
    
    private func setDataToUserDefault(with data: Data, key: URL) {
        UserDefaults.standard.set(data, forKey: key.description)
        print("Сохранено в кэш")
    }
    
//    Через URLCache
//    private func getDataFromCache(from url: URL) -> Data? {
//        let urlRequest = URLRequest(url: url)
//        if let cacheResponse = URLCache.shared.cachedResponse(for: urlRequest) {
//            return cacheResponse.data
//        }
//        return nil
//    }
//
//    private func setDataToCache(with data: Data, response: URLResponse) {
//        guard let url = response.url else { return }
//        let urlRequest = URLRequest(url: url)
//        let cachedResponse = CachedURLResponse(response: response, data: data)
//        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
//    }
    
}

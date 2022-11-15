//
//  ImageManager.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 11.11.2022.
//

import UIKit

//class CustomImage: UIImageView {
//    
//    func fetchImageData(from url: URL) {
//        image = nil
//        
//        if let cacheImage = getImageFromCache(from: url) {
//            self.image = 
//        }
//        
//        task = URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                print(error)
//            }
//            
//            guard let data =  data, let newImage = UIImage(data: data) else {
//                print("Error load")
//                return
//            }
//            
//            self.imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
//            
//            DispatchQueue.main.async {
//                self.image = newImage
//            }
//        }
//        task.resume()
//    }
//    
//    private func getImageFromCache(from url: URL) -> UIImage? {
//        let urlRequest = URLRequest(url: url)
//        if let cacheResponse = URLCache.shared.cachedResponse(for: urlRequest) {
//            return UIImage(data: cacheResponse.data)
//        }
//    }
//    
//    private func setDataToCache(with data: Data, response: URLResponse) {
//        guard let url = response.url else { return }
//        let urlRequest = URLRequest(url: url)
//        let cachedResponse = CachedURLResponse(response: response, data: data)
//        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
//    }
//}

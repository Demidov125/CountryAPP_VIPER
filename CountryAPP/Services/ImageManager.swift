//
//  ImageManager.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 11.11.2022.
//

import UIKit

class ImageManager: UIImageView {
    
    static let shared = ImageManager()
    
    var task: URLSessionDataTask!
    var imageCache = NSCache<AnyObject, AnyObject>()
        
    func fetchImageData(from url: URL){
        image = nil
        
        if let task = task {
            task.cancel()
        }
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, let newImage = UIImage(data: data) else {
                print("Error load")
                return
            }
            
            self.imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task.resume()
    }
}

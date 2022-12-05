//
//  NetworkManager.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 09.11.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private var api = ApiList.countriesInfo
    
    func fetchData(completion: @escaping (_ countries: [Country]) -> Void) {
        guard let url = URL(string: api.rawValue) else { return }
        
        if let cachedData = getDataFromUSerDefaults(from: url) {
            DispatchQueue.main.async {
                completion(cachedData)
            }
            DataManager.shared.setCountries(cachedData)
            print("Выгружен список из UserDefaults")
            return
        }
        print("Загружено из сети")
        loadDataFromNetwork(from: url) { data in completion(data) }
    }
    
    private func loadDataFromNetwork(from url: URL, completion: @escaping ([Country]) -> Void) {
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Discription")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let countries = try decoder.decode(Countries.self, from: data)
                let countryArray = countries.geonames
                self?.setDataToUserDefault(with: data, key: url)
                DataManager.shared.setCountries(countryArray)
                DispatchQueue.main.async {
                    completion(countryArray)
                }
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
    
    // Кэширование через UserDefaults
        private func getDataFromUSerDefaults(from url: URL) -> [Country]? {
            if let cacheData = UserDefaults.standard.object(forKey: url.description) {
                let decoder = JSONDecoder()
                let countries = try! decoder.decode(Countries.self, from: cacheData as! Data)
                let countryArray = countries.geonames
                
                return countryArray
            }
            return []
        }
        
        private func setDataToUserDefault(with data: Data, key: URL) {
            UserDefaults.standard.set(data, forKey: key.description)
            print("Сохранен список в UesrDefault")
        }
}

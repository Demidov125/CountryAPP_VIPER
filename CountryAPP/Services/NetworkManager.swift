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
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Discription")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let countries = try decoder.decode(Countries.self, from: data)
                let countryArray = countries.geonames
                DataManager.shared.setCountries(countryArray)
                DispatchQueue.main.async {
                    completion(countryArray)
                }
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}

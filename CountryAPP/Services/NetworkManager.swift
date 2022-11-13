//
//  NetworkManager.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 09.11.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let api = "http://api.geonames.org/countryInfoJSON?formatted=true&lang=ru&username=demidov777&style=full"
    
    func fetchData(completion: @escaping (_ countries: [Country]) -> Void) {
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No Discription")
                return
            }
            
            do {
                print("Start")
                let decoder = JSONDecoder()
                let countries = try decoder.decode(Countries.self, from: data)
                let countryArray = countries.geonames
                print("Load")
                DataManager.shared.setCountries(countryArray)
                DispatchQueue.main.async {
                    completion(countryArray)
                    print("Finish")
                }
            } catch let error {
                print("Error serialization json", error)
            }
            
        }.resume()
    }
}

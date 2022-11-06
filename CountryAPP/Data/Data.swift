//
//  Data.swift
//  CarBrandsAPP
//
//  Created by Юрий Демидов on 26.10.2022.
//

import Foundation

class CountryData {
    static func getData() -> [Country] {
        var countries: [Country] = []
        
        guard let url = URL(string: "http://api.geonames.org/countryInfoJSON?formatted=true&lang=ru&username=demidov777&style=full")
        else {return []}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let countri = try JSONDecoder().decode(Contryes.self, from: data)
                DispatchQueue.main.async {
                    countries = countri.geonames
                }
                print("ok")
            } catch let error {
                print(error)
            }
        }.resume()
        return countries
    }
}

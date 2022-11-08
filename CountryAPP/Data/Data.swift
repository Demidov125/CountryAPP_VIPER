//
//  Data.swift
//  CarBrandsAPP
//
//  Created by Юрий Демидов on 26.10.2022.
//

import Foundation

class CountryData {
    
    static let shared = CountryData()
    
    func getData() {
//        countrues = [Country(countryName: "Тест", population: "10", countryCode: "ru")]
        //        guard let url = URL(string: "http://api.geonames.org/countryInfoJSON?formatted=true&lang=ru&username=demidov777&style=full")
        //        else {return}
        //
        //        URLSession.shared.dataTask(with: url) { (data, _, _) in
        //            guard let data = data else { return }
        //            do {
        //                let countri = try JSONDecoder().decode(Contryes.self, from: data)
        //                DispatchQueue.main.async {
        //                    self.countrues.append(contentsOf: countri.geonames)
        //                }
        //                print("ok")
        //            } catch let error {
        //                print(error)
        //            }
        //        }.resume()
    }
    
    func loadImage(index: String) -> Data? {
        guard let url = URL(string: "https://img.geonames.org/flags/x/\(index).gif") else {
            return nil
        }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}
    

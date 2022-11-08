//
//  DetailInteractor.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 08.11.2022.
//

import Foundation

protocol DetailInputInteractorProtocol: AnyObject {
    init(presenter: DetailOutputInteractorProtocol, country: Country)
    func provideDetail()
}

protocol DetailOutputInteractorProtocol: AnyObject {
    func recieveCountryDetail(with countryInfo: CountyInfo)
}

class DetailInteractor: DetailInputInteractorProtocol {
    
    
    unowned var presenter: DetailOutputInteractorProtocol
    var country: Country
    
    required init(presenter: DetailOutputInteractorProtocol, country: Country) {
        self.presenter = presenter
        self.country = country
    }
    
    
    func provideDetail() {
        DispatchQueue.main.async {
            guard let index = self.country.countryCode?.lowercased() else { return }
            let imageData = CountryData.shared.loadImage(index: index)
            let detailInfo = CountyInfo(
                countryName: self.country.countryName!,
                countryPopulation: Int(self.country.population!)!,
                countryFlagImage: imageData
            )
            
            self.presenter.recieveCountryDetail(with: detailInfo)
        }
    }
}
        
//            guard let index = self.country.countryCode?.lowercased() else { return }
//            guard let url = URL(string: "https://img.geonames.org/flags/x/\(index).gif") else {
//                return
//            }
//
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if let error = error {
//                    print(error)
//                    return
//                }
//                if let response = response {
//                    print(response)
//                }
//                if let data = data {
//                    let detailInfo = CountyInfo(
//                        countryName: self.country.countryName!,
//                        countryPopulation: Int(self.country.population!)!,
//                        countryFlagImage: data
//                    )
//                    self.presenter.recieveCountryDetail(with: detailInfo)
//                    }
//                }.resume()
//            }
//    }



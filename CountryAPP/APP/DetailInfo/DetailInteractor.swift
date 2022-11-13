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
    private let country: Country
    
    required init(presenter: DetailOutputInteractorProtocol, country: Country) {
        self.presenter = presenter
        self.country = country
    }
    
    
    func provideDetail() {
        DispatchQueue.global().async {
            if let ImageData = try? Data(contentsOf: self.country.imageURL) {
                DispatchQueue.main.sync {
                    let detailInfo = CountyInfo(
                        countryName: self.country.countryName,
                        countryPopulation: Int(self.country.population)!,
                        countryFlagImage: ImageData)
                    self.presenter.recieveCountryDetail(with: detailInfo)
                }
            }
            
        }
    }
}
    

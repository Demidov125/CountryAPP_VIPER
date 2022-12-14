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
        let image: Data = {
            var data = Data()
            ImageManager.shared.fetchImage(from: self.country.imageURL) { image in data = image }
            return data
        }()
            
            let detailInfo = CountyInfo(
                countryName: self.country.countryName,
                countryPopulation: Int(self.country.population) ?? 0,
                countryFlagData: image)
            
            self.presenter.recieveCountryDetail(with: detailInfo)
        }
    }



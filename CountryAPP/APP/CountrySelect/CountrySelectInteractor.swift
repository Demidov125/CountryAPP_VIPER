//
//  CountrySelectInteractor.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 11.11.2022.
//

import Foundation

protocol CountrySelectInteractorInputProtocol: AnyObject {
    init(presenter: CountrySelectInteractorOutputProtocol)
    func fetchCountries()
    func getCountry(at IndexPath: IndexPath)
}

protocol CountrySelectInteractorOutputProtocol: AnyObject {
    func countriesDidReceive(_ countries: [Country])
    func countryDidReceive(_ country: Country)
}


class CountrySelectInteractor: CountrySelectInteractorInputProtocol {
    unowned var presenter: CountrySelectInteractorOutputProtocol
    
    required init(presenter: CountrySelectInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchCountries() {
        NetworkManager.shared.fetchData { countries in
            self.presenter.countriesDidReceive(countries)
        }
    }
    
    func getCountry(at IndexPath: IndexPath) {
        let country = DataManager.shared.getCountry(at: IndexPath)
        presenter.countryDidReceive(country)
    }
}

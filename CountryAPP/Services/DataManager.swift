//
//  DataManager.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 09.11.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    var countries: [Country] = []
    var filteredCountries: [Country] = []
    
    private init() {}
    
    func setCountries(_ countries: [Country]) {
        self.countries = countries
    }
    
    func getCountry(at indexPath: IndexPath) -> Country {
        countries[indexPath.item]
    }
    
    func findIndex(country: String) -> IndexPath {
        let index = countries.map{$0.countryName}.firstIndex(of: country)!
        return IndexPath(row: index, section: 0)
    }
}

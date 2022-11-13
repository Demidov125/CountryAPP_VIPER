//
//  DataManager.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 09.11.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private var countries: [Country] = []
    private var images: [CountyImage] = []
    
    private init() {}
    
    func setCountries(_ countries: [Country]) {
        self.countries = countries
    }
    
    func getCountry(at indexPath: IndexPath) -> Country {
        countries[indexPath.item]
    }
}

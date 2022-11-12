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
    
    private init() {}
    
    func setCourses(_ countries: [Country]) {
        self.countries = countries
    }
    
    func getCountry(at indexPath: IndexPath) -> Country {
        countries[indexPath.item]
    }
}

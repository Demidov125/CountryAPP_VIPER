//
//  CountryCellViewModel.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 11.11.2022.
//

import Foundation

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var country: String { get }
}

protocol ItemPresentable {
    var items: [CellIdentifiable] { get set }
    var filteredItems: [CellIdentifiable] { get set }
}

class CountryCellViewModel: CellIdentifiable {
    let imageURL: String
    let country: String
    
    var cellIdentifier: String {
        "cell"
    }
    
    init(country: Country) {
        self.imageURL = country.imageURL
        self.country = country.countryName
        }
    }
    
    class CountrySectionViewModel: ItemPresentable {
        var items: [CellIdentifiable] = []
        var filteredItems: [CellIdentifiable] = []
    }

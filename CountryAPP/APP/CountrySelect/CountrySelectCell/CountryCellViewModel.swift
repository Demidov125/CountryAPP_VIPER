//
//  CountryCellViewModel.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 11.11.2022.
//

import Foundation

protocol CellIdentifiable {
    var cellIdentifier: String { get }
}

protocol ItemPresentable {
    var items: [CellIdentifiable] { get set }
}

class CountryCellViewModel: CellIdentifiable {
    let imageURL: String
    
    var cellIdentifier: String {
        "cell"
    }
    
    init(country: Country) {
        self.imageURL = country.imageURL
        }
    }
    
    class CountrySectionViewModel: ItemPresentable {
        var items: [CellIdentifiable] = []
    }

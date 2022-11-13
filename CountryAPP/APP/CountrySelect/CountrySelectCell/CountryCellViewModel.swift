//
//  CountryCellViewModel.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 11.11.2022.
//

import Foundation

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeigh: Int { get }
}

protocol ItemPresentable {
    var items: [CellIdentifiable] { get set }
}

class CountryCellViewModel: CellIdentifiable {
    let image: URL
    
    var cellIdentifier: String {
        "cell"
    }
    
    var cellHeigh: Int {
        70
    }
    
    init(country: Country) {
        self.image = country.imageURL
        }
    }
    
    class CountrySectionViewModel: ItemPresentable {
        var items: [CellIdentifiable] = []
    }

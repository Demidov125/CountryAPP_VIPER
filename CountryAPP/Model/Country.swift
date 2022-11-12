//
//  Country.swift
//  CarBrandsAPP
//
//  Created by Юрий Демидов on 26.10.2022.
//

import UIKit

struct Country: Decodable {
    let countryName: String
    let population: String
    let countryCode: String
    var imageURL: URL {
        URL(string: "https://img.geonames.org/flags/x/\(countryCode.lowercased()).gif")!
    }
}

struct Countries: Decodable {
    let geonames: [Country]
}



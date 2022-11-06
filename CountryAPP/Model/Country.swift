//
//  Country.swift
//  CarBrandsAPP
//
//  Created by Юрий Демидов on 26.10.2022.
//

import UIKit

struct Country: Decodable {
    let countryName: String?
    let population: String?
    let countryCode: String?
}

struct Contryes: Decodable {
    let geonames: [Country]
}



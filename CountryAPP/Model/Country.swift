//
//  Country.swift
//  CarBrandsAPP
//
//  Created by Юрий Демидов on 26.10.2022.
//

import UIKit

struct Country: Decodable, Equatable {
    let countryName: String
    let population: String
    let countryCode: String
    var imageURL: String {
        return ApiList.flagsImage.rawValue + countryCode.lowercased() + ".gif"
    }
    static func == (lhs: Country, rhs: Country) -> Bool {
        lhs.countryName == rhs.countryName
    }
}

struct Countries: Decodable {
    let geonames: [Country]
}



//
//  Data.swift
//  CarBrandsAPP
//
//  Created by Юрий Демидов on 26.10.2022.
//

import Foundation

class CountryData {
    static func getData() -> [Country] {
        let countries = [
            Country(countryName: "Абхазия", countryPopulation: 245246),
            Country(countryName: "Австралия", countryPopulation: 26573000),
            Country(countryName: "Австрия", countryPopulation: 8915382),
            Country(countryName: "Азербайджан", countryPopulation: 10119100),
            Country(countryName: "Албанияя", countryPopulation: 2845955),
            Country(countryName: "Алжир", countryPopulation: 45653000),
            Country(countryName: "Ангола", countryPopulation: 34825000),
            Country(countryName: "Андора", countryPopulation: 76177),
            Country(countryName: "Аргентина", countryPopulation: 44938712),
            Country(countryName: "Армения", countryPopulation: 2962100),
            Country(countryName: "Афганистан", countryPopulation: 39225560),
            Country(countryName: "Бангладеш", countryPopulation: 179634190),
            Country(countryName: "Барбадос", countryPopulation: 287000),
            Country(countryName: "Бахрейн", countryPopulation: 1451200),
            Country(countryName: "Беларусь", countryPopulation: 9255524),
            Country(countryName: "Белиз", countryPopulation: 387879),
            Country(countryName: "Бельгия", countryPopulation: 11476279),
            Country(countryName: "Беннин", countryPopulation: 10315244),
            Country(countryName: "Болгария", countryPopulation: 6951482),
            Country(countryName: "Боливия", countryPopulation: 11469896),
            Country(countryName: "Россия", countryPopulation: 147190000),
        ]
        return countries
    }
}



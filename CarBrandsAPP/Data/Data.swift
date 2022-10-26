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
            Country(countryName: "Абхазия", countryPopulation: 100_000),
            Country(countryName: "Австралия", countryPopulation: 100_000),
            Country(countryName: "Австрия", countryPopulation: 100_000),
            Country(countryName: "Азербайджан", countryPopulation: 100_000),
            Country(countryName: "Албанияя", countryPopulation: 100_000),
            Country(countryName: "Алжир", countryPopulation: 100_000),
            Country(countryName: "Ангола", countryPopulation: 100_000),
            Country(countryName: "Андора", countryPopulation: 100_000),
            Country(countryName: "Аргентина", countryPopulation: 100_000),
            Country(countryName: "Армения", countryPopulation: 100_000),
            Country(countryName: "Афганистан", countryPopulation: 100_000),
            Country(countryName: "Бангладеш", countryPopulation: 100_000),
            Country(countryName: "Барбадос", countryPopulation: 100_000),
            Country(countryName: "Бахрейн", countryPopulation: 100_000),
            Country(countryName: "Беларусь", countryPopulation: 100_000),
            Country(countryName: "Белиз", countryPopulation: 100_000),
            Country(countryName: "Бельгия", countryPopulation: 100_000),
            Country(countryName: "Беннин", countryPopulation: 100_000),
            Country(countryName: "Болгария", countryPopulation: 100_000),
            Country(countryName: "Боливия", countryPopulation: 100_000),
            Country(countryName: "Россия", countryPopulation: 100_000_000),
        ]
        return countries
    }
}

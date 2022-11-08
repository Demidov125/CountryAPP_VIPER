//
//  DetailPresenter.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 08.11.2022.
//

import Foundation

struct CountyInfo {
    let countryName: String
    let countryPopulation: Int
    let countryFlagImage: Data?
}

class DetailPresenter: DetalVCOutputProtocol {
    
    unowned let view: DetailVCInputProtocol
    var interactor: DetailInputInteractorProtocol!
    
    required init(view: DetailVCInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideDetail()
    }
}

extension DetailPresenter: DetailOutputInteractorProtocol {
    func recieveCountryDetail(with countryInfo: CountyInfo) {
        let populationInfo = "\(countryInfo.countryPopulation.formattedWithSeparator) чел."
        
        view.displayCountryName(with: countryInfo.countryName)
        view.displayPopulationInfo(with: populationInfo)
        
        guard let image = countryInfo.countryFlagImage else {return}
        view.displayCountryImage(with: image)
    }
}

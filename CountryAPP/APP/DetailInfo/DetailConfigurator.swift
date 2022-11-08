//
//  DetailConfigurator.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 08.11.2022.
//

import Foundation

protocol DetailConfiguratorInputProtocol {
    func configure(view: DetailVC, country: Country)
}

class Configurator: DetailConfiguratorInputProtocol {
    func configure(view: DetailVC, country: Country) {
        let presenter = DetailPresenter(view: view)
        let interactor = DetailInteractor(presenter: presenter, country: country)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
    
    
}

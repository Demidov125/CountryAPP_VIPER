//
//  CountrySelectConfigurator.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 12.11.2022.
//

import Foundation

protocol CountrySelectConfiguratorInputProtocol {
    func configure(with viewController: ViewController)
}

class CountrySelectConfigurator: CountrySelectConfiguratorInputProtocol {
    func configure(with viewController: ViewController) {
        let presenter = CountrySelectPresenter(view: viewController)
        let interactor = CountrySelectInteractor(presenter: presenter)
        let router = CountrySelectRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

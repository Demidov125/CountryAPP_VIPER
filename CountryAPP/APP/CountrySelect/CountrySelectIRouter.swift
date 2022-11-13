//
//  CountrySelectIRouter.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 11.11.2022.
//


protocol CountrySelectRouterInputProtocol {
    init(viewController: CountrySelectViewController)
    func openDetailVC(for country: Country)
}

class CountrySelectRouter: CountrySelectRouterInputProtocol {
   
    
    unowned let viewController: CountrySelectViewController
    
    required init(viewController: CountrySelectViewController) {
        self.viewController = viewController
    }
    
    func openDetailVC(for country: Country) {
        let detailVC = DetailViewController()
        let configurator: DetailConfiguratorInputProtocol = Configurator()
        configurator.configure(view: detailVC, and: country)
        viewController.navigationController?.present(detailVC, animated: true)
    }
}

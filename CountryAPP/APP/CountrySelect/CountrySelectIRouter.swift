//
//  CountrySelectIRouter.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 11.11.2022.
//


protocol CountrySelectRouterInputProtocol {
    init(viewController: ViewController)
    func openDetailVC(for country: Country)
}

class CountrySelectRouter: CountrySelectRouterInputProtocol {
   
    
    unowned let viewController: ViewController
    
    required init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func openDetailVC(for country: Country) {
        let detailVC = DetailVC()
        let configurator: DetailConfiguratorInputProtocol = Configurator()
        configurator.configure(view: detailVC, and: country)
        viewController.navigationController?.present(detailVC, animated: true)
    }
}

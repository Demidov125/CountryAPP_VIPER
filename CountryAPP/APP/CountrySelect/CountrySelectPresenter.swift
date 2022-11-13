//
//  CountrySelectPresenter.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 11.11.2022.
//

import Foundation

struct CountyImage {
    let countryFlagImage: Data?
}

class CountrySelectPresenter: CountrySelectViewOutputProtocol {
    
    unowned let view: CountrySelectViewInputProtocol
    var interactor: CountrySelectInteractorInputProtocol!
    var router: CountrySelectRouterInputProtocol!
    
    required init(view: CountrySelectViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchCountries()
    }
    
    func didTapCell(at indexPath: IndexPath) {
        interactor.getCountry(at: indexPath)
    }
}

extension CountrySelectPresenter: CountrySelectInteractorOutputProtocol {
    func countriesDidReceive(_ countries: [Country]) {
        let section = CountrySectionViewModel()
        countries.forEach { section.items.append(CountryCellViewModel(country: $0))
        }
        view.reloadData(for: section)
    }
    
    func countryDidReceive(_ country: Country) {
        router.openDetailVC(for: country)
    }
}


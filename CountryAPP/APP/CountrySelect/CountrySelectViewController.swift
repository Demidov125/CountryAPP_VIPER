//
//  CountrySelectViewController.swift
//  CarBrandsAPP
//
//  Created by Юрий Демидов on 25.10.2022.
//

import UIKit

protocol CountrySelectViewInputProtocol: AnyObject {
    func reloadData(for section: CountrySectionViewModel)
}

protocol CountrySelectViewOutputProtocol: AnyObject {
    init(view: CountrySelectViewInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
}

class CountrySelectViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private var searchController: UISearchController!
    
    private var section: ItemPresentable = CountrySectionViewModel()
    private let configurator: CountrySelectConfiguratorInputProtocol = CountrySelectConfigurator()
    
    var presenter: CountrySelectViewOutputProtocol!
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Угадай страну"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Papyrus", size: 28)!]
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск страны"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setupCollectionView()  {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CountryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
                
        view.addSubview(collectionView)
    }
}


extension CountrySelectViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return self.section.filteredItems.count
        }
       return self.section.items.count
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let viewModel: CellIdentifiable
        
        if isFiltering{
            viewModel = section.filteredItems[indexPath.item]
        } else {
            viewModel = section.items[indexPath.item]
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellIdentifier, for: indexPath) as! CountryCollectionViewCell
        cell.viewModel = viewModel
        return cell
    }
}

extension CountrySelectViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index: IndexPath
        
        if isFiltering{
            index = DataManager.shared.findIndex(country: section.filteredItems[indexPath.item].country)
        } else {
            index = indexPath
        }
        presenter.didTapCell(at: index)
    }
}


extension CountrySelectViewController: CountrySelectViewInputProtocol {
    func reloadData(for section: CountrySectionViewModel) {
        self.section = section
        collectionView.reloadData()
    }
}

extension CountrySelectViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
            filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        self.section.filteredItems = self.section.items.filter({ (country: CellIdentifiable) -> Bool in return country.country.lowercased().contains(searchText.lowercased())
        })
        
        collectionView.reloadData()
    }
}


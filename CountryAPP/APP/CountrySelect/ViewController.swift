//
//  ViewController.swift
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

class ViewController: UIViewController {
    private var collectionView: UICollectionView!
    
    private var section: ItemPresentable = CountrySectionViewModel()
    private let configurator: CountrySelectConfiguratorInputProtocol = CountrySelectConfigurator()
    
    var presenter: CountrySelectViewOutputProtocol!
    
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


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.section.items.count
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = section.items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellIdentifier, for: indexPath) as! CountryCollectionViewCell
        cell.viewModel = viewModel
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didTapCell(at: indexPath)
    }
}


extension ViewController: CountrySelectViewInputProtocol {
    func reloadData(for section: CountrySectionViewModel) {
        self.section = section
        collectionView.reloadData()
    }
}


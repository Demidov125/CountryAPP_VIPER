//
//  ViewController.swift
//  CarBrandsAPP
//
//  Created by Юрий Демидов on 25.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let identifier = "cell"
    private let data = CountryData.getData()
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup()  {
        navigationItem.title = "Угадай страну"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Papyrus", size: 30)!]
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        view.addSubview(collectionView)
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell
        cell.flagImage.image = UIImage(named: data[indexPath.item].countryName)
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let VC = DetailVC()
        VC.country = data[indexPath.item]
        navigationController?.present(VC, animated: true)
    }
}


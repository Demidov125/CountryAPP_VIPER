//
//  Adapter.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 31.10.2022.
//

import UIKit

class Adapter: NSObject {
    let identifier = "cell"
    var data = CountryData.getData()
    weak var viewController: ViewController?
    
    func setup(for collectionView: UICollectionView) {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension Adapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        detailVC.country = data[indexPath.item]
        viewController?.navigationController?.present(detailVC, animated: true)
        }
}

extension Adapter: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return data.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell
            cell.update(from: data[indexPath.item])
            return cell
        }
    }

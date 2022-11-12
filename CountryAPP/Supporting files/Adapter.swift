//
//  Adapter.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 31.10.2022.
//

import UIKit

////class Adapter: NSObject {
//    let identifier = "cell"
//    weak var viewController: ViewController?
//    
//    func setup(for collectionView: UICollectionView) {
//        collectionView.register(CountryCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.delegate = self
//        collectionView.dataSource = self
//    }
//}
//    
//    extension Adapter: UICollectionViewDelegate {
//        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            let detailVC = DetailVC()
//            detailVC.country = viewController?.countrys[indexPath.item]
//            viewController?.navigationController?.present(detailVC, animated: true)
//        }
//    }
//    
//    extension Adapter: UICollectionViewDataSource {
//        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return (viewController?.countrys.count)!
//        }
//        
//        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CountryCollectionViewCell
////            cell.update((viewController?.countrys[indexPath.item].countryCode)!)
//            return cell
//        }
//    }

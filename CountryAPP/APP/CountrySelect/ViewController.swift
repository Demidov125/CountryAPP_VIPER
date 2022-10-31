//
//  ViewController.swift
//  CarBrandsAPP
//
//  Created by Юрий Демидов on 25.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private var adapter = Adapter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup()  {
        navigationItem.title = "Угадай страну"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Papyrus", size: 30)!]
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
       
        adapter.setup(for: collectionView)
        view.addSubview(collectionView)
        
        adapter.viewController = self
    }
}


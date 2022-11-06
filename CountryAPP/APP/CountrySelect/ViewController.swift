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
    var countrys: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()
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

extension ViewController {
    func reload() {
        guard let url = URL(string: "http://api.geonames.org/countryInfoJSON?formatted=true&lang=ru&username=demidov777&style=full")
        else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let countri = try JSONDecoder().decode(Contryes.self, from: data)
                self.countrys = countri.geonames
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                print("ok")
            } catch let error {
                print(error)
            }
        }.resume()
    }
}


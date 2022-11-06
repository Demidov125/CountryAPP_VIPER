//
//  CollectionViewCell.swift
//  CarBrandsAPP
//
//  Created by Юрий Демидов on 25.10.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var flagImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 9
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func update(_ name: String) {
        let names = name.lowercased()
        guard let url = URL(string: "https://img.geonames.org/flags/x/\(names).gif") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.flagImage.image = image
                }
            }
        }.resume()
    }
    
    private func setup() {
        contentView.addSubview(flagImage)
        
        NSLayoutConstraint.activate([
            flagImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            flagImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            flagImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            flagImage.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
    
    
    override func layoutSubviews() {
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 7, height: 15)
        clipsToBounds = false
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


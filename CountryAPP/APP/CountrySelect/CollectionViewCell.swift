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
    
    func update(from country: Country) {
        flagImage.image = UIImage(named: country.countryName)
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


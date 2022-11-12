//
//  CountryCollectionViewCell.swift
//  CarBrandsAPP
//
//  Created by Юрий Демидов on 25.10.2022.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: CellIdentifiable? { get set }
}

class CountryCollectionViewCell: UICollectionViewCell, CellModelRepresentable {
    var viewModel: CellIdentifiable? {
        didSet {
            updateView()
        }
    }
    
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
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 7, height: 15)
    }
    
    func updateView() {
        guard let cellViewModel = viewModel as? CountryCellViewModel else { return }
        DispatchQueue.global().async {
            if let ImageData = ImageManager.shared.fetchImageData(from: cellViewModel.imageURL) {
                DispatchQueue.main.async {
                    self.flagImage.image = UIImage(data: ImageData)
                }
            }
        }
    }
       
    private func setupLayout() {
        contentView.addSubview(flagImage)
        
        NSLayoutConstraint.activate([
            flagImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            flagImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            flagImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            flagImage.heightAnchor.constraint(equalToConstant: 70),
        ])
    }
}


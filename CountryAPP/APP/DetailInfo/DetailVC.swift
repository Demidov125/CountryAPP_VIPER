//
//  DetailVC.swift
//  CarBrandsAPP
//
//  Created by Юрий Демидов on 26.10.2022.
//

import UIKit

class DetailVC: UIViewController {
    var country: Country!
    
    private var countryImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = label.font.withSize(50)
        label.tintColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = label.font.withSize(20)
        label.tintColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let populationCount: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = label.font.withSize(30)
        label.tintColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layoutSetup()
    }
    
    private func setup() {
        view.addSubview(countryImage)
        view.addSubview(countryLabel)
        view.addSubview(textLabel)
        view.addSubview(populationCount)
        
        view.backgroundColor = .systemGray5
        
        countryImage.image = UIImage(named: country.countryName)
        countryLabel.text = country.countryName
        textLabel.text = "Численность населения:"
        populationCount.text = "\(country.countryPopulation.formattedWithSeparator) чел."
    }
    
    private func layoutSetup() {
        NSLayoutConstraint.activate([
            countryImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            countryImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            countryImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            countryImage.heightAnchor.constraint(equalTo: countryImage.widthAnchor, multiplier: 0.66),
            
            countryLabel.topAnchor.constraint(equalTo: countryImage.bottomAnchor, constant: 16),
            countryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: countryImage.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: countryImage.trailingAnchor),
            
            populationCount.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
            populationCount.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            populationCount.trailingAnchor.constraint(equalTo: textLabel.trailingAnchor),
        ])
    }
}


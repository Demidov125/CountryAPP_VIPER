//
//  DetailViewController.swift
//  CarBrandsAPP
//
//  Created by Юрий Демидов on 26.10.2022.
//

import UIKit

protocol DetailVCInputProtocol: AnyObject {
    func displayCountryName(with title: String)
    func displayPopulationInfo(with title: String)
    func displayCountryImage(with imageData: Data)
}

protocol DetalVCOutputProtocol: AnyObject {
    init(view: DetailVCInputProtocol)
    func showDetails()
}

class DetailViewController: UIViewController {
    
    let configurator: DetailConfiguratorInputProtocol = Configurator()
    var presenter: DetalVCOutputProtocol!
    
    private var countryImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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
        label.text = "Численность населения:"
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
        setupUI()
        setupLayout()
        presenter.showDetails()
    }
    
    private func setupUI() {
        view.addSubview(countryImage)
        view.addSubview(countryLabel)
        view.addSubview(textLabel)
        view.addSubview(populationCount)
        
        view.backgroundColor = .systemGray5
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            countryImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            countryImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            countryImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            countryImage.heightAnchor.constraint(equalTo: countryImage.widthAnchor, multiplier: 0.66),
            
            countryLabel.topAnchor.constraint(equalTo: countryImage.bottomAnchor, constant: 16),
            countryLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            countryLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            
            textLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: countryImage.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: countryImage.trailingAnchor),
            
            populationCount.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
            populationCount.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            populationCount.trailingAnchor.constraint(equalTo: textLabel.trailingAnchor),
        ])
    }
}

extension DetailViewController: DetailVCInputProtocol {
    func displayCountryName(with title: String) {
        countryLabel.text = title
    }
    
    func displayPopulationInfo(with title: String) {
        populationCount.text = title
    }
    
    func displayCountryImage(with imageData: Data) {
        countryImage.image = UIImage(data: imageData) 
    }
}



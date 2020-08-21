//
//  WeatherListCell.swift
//  Weathery
//
//  Created by Shayan on 19/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit

final class WeatherListCell: UITableViewCell {
    private let cityLabel = UILabel()
    private let temperatureLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemBackground
        setupCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with weatherViewModel: WeatherViewModel) {
        cityLabel.text = weatherViewModel.city
        temperatureLabel.text = "\(weatherViewModel.temperature)"
    }
    
    private func setupCellView() {
        setupCityLabel()
        setupTemperatureLabel()
    }
    
    private func setupCityLabel() {
        addSubview(cityLabel)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cityLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func setupTemperatureLabel() {
        addSubview(temperatureLabel)
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.text = "25"
        
        NSLayoutConstraint.activate([
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            temperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

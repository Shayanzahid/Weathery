//
//  WeatherListView.swift
//  Weathery
//
//  Created by Shayan on 19/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit

final class WeatherListView: UIView {
    var weatherListController: WeatherListController? {
        didSet {
            weatherListController?.title = "Weathery"
            weatherListController?.navigationController?.navigationBar.prefersLargeTitles = true
            weatherListController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: weatherListController, action: #selector(WeatherListController.plusTapped))
            weatherListController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: weatherListController, action: #selector(WeatherListController.settingsTapped))
        }
    }
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScreen() {
        setupTableView()
    }
    
    private func setupTableView() {
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(WeatherListCell.self, forCellReuseIdentifier: "WeatherCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//
//  ViewController.swift
//  Weathery
//
//  Created by Shayan on 19/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit

final class WeatherListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let weatherListView = WeatherListView()
    
    override func loadView() {
        view = weatherListView
        weatherListView.weatherListController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherListView.tableView.delegate = self
        weatherListView.tableView.dataSource = self
    }
}

extension WeatherListController {
    @objc func plusTapped() {
        let addCityController = UINavigationController(rootViewController: AddCityContoller())
        present(addCityController, animated: true)
    }
    
    @objc func settingsTapped() {
        
    }
}

extension WeatherListController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherListCell
        cell.setupCell(with: "Lahore")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


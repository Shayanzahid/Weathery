//
//  ViewController.swift
//  Weathery
//
//  Created by Shayan on 19/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit
import Combine

final class WeatherListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let weatherListView = WeatherListView()
    
    private var weatherListViewModel = WeatherListViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func loadView() {
        view = weatherListView
        weatherListView.weatherListController = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("APPEARED")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherListView.tableView.delegate = self
        weatherListView.tableView.dataSource = self
        
        weatherListViewModel.fetchPersistedWeatherViewModels()
    }
}

extension WeatherListController {
    @objc func plusTapped() {
        let addCityController = AddCityContoller()
        addCityController.delegate = self
        let addCityNavController = UINavigationController(rootViewController: addCityController)
        present(addCityNavController, animated: true)
    }
    
    @objc func settingsTapped() {
        let settingsController = SettingsListController()
        settingsController.publisher.sink { settingsViewModel in
            print(settingsViewModel)
        }.store(in: &cancellables)
        
        let settingsNavController = UINavigationController(rootViewController: settingsController)
        present(settingsNavController, animated: true)
    }
}

extension WeatherListController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherListCell
        let weatherViewModel = weatherListViewModel.weatherViewModel(at: indexPath.row)
        cell.setupCell(with: weatherViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension WeatherListController: AddWeatherDelegate {
    func didAdd(_ weatherViewModel: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(weatherViewModel)
        weatherListView.tableView.reloadData()
    }
}


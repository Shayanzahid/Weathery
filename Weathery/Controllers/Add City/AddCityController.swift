//
//  AddCityController.swift
//  Weathery
//
//  Created by Shayan on 19/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit

protocol AddWeatherDelegate: class {
    func didAdd(_ weatherViewModel: WeatherViewModel)
}

final class AddCityContoller: UIViewController {
    private let addCityView = AddCityView()
    private var addCityViewModel = AddCityViewModel()
    
    weak var delegate: AddWeatherDelegate?
    
    override func loadView() {
        view = addCityView
        addCityView.addCityController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    @objc func saveTapped() {
        if !addCityView.isCityFieldEmpty {
            fetchWeather(for: addCityView.cityTextField.text!)
        }
    }
    
    private func fetchWeather(for city: String) {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=0fa72fbc73a3dd5d5c84e056ec2787de&units=metric") else {
            return
        }
        
        let resource = Resource<Weather>(url: url)
        
        Webservice().load(resource: resource) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let weather):
                    let weatherViewModel = WeatherViewModel(weather: weather)
                    self.delegate?.didAdd(weatherViewModel)
                    self.dismiss(animated: true)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    private func bindViewModel() {
        addCityViewModel.city.bind {
            print($0)
        }
    }
}

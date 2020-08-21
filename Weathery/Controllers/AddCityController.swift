//
//  AddCityController.swift
//  Weathery
//
//  Created by Shayan on 19/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit

protocol CityAddedDelegate: class {
    func didAdd(_ weather: Weather)
}

final class AddCityContoller: UIViewController {
    private let addCityView = AddCityView()
    
    weak var delegate: CityAddedDelegate?
    
    override func loadView() {
        view = addCityView
        addCityView.addCityController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                    self.delegate?.didAdd(weather)
                    self.dismiss(animated: true)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}

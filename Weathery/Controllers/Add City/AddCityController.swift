//
//  AddCityController.swift
//  Weathery
//
//  Created by Shayan on 19/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit
import Combine

protocol AddWeatherDelegate: class {
    func didAdd(_ weatherViewModel: WeatherViewModel)
}

final class AddCityContoller: UIViewController {
    private let addCityView = AddCityView()
    private var addCityViewModel = AddCityViewModel()
    
    weak var delegate: AddWeatherDelegate?
    
    private var cancellables = Set<AnyCancellable>()
    
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
            addCityViewModel.fetchWeather(for: addCityView.cityTextField.text!)
        }
    }
    
    private func bindViewModel() {
        
        addCityViewModel.weatherPublisher.sink(receiveCompletion: { error in
            print(error)
        }) { [weak self] weather in
            guard let self = self else { return }

            let weatherViewModel = WeatherViewModel(weather: weather)
            self.delegate?.didAdd(weatherViewModel)
            self.dismiss(animated: true)
        }.store(in: &cancellables)
        
//        addCityViewModel.weatherPublisher.flatMap { value in
//            Just(value).tryMap { value
//
//            }
//        }
    }
}

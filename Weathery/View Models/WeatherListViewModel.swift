//
//  WeatherListViewModel.swift
//  Weathery
//
//  Created by Shayan on 21/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation

// MARK: - WeatherListViewModel represents the whole screen

struct WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(in section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func weatherViewModel(at index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
}

// MARK: - WeatherViewModel represents each individual weather cell in the tableView

struct WeatherViewModel {
    let weather: Weather
    
    var city: String {
        return weather.name
    }
    
    var temperature: Double {
        return weather.main.temp
    }
    
    var temperatureMin: Double {
        return weather.main.tempMin
    }
    
    var temperatureMax: Double {
        return weather.main.tempMax
    }
}

//
//  WeatherListViewModel.swift
//  Weathery
//
//  Created by Shayan on 21/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation

// MARK: - WeatherListViewModel represents the whole screen

class WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
        vm.persist()
    }
    
    func fetchPersistedWeatherViewModels() {
        let weathers = Persistence.shared.fetch(WeatherEntity.self)
        weatherViewModels = weathers.map { WeatherViewModel(weather: $0.toWeather) }
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
    
    func persist() {
        let weatherEntity = WeatherEntity(context: Persistence.shared.context)
        weatherEntity.name = city
        weatherEntity.temperature = temperature
        Persistence.shared.save()
    }
}

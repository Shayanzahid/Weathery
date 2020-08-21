//
//  WeatherListViewModel.swift
//  Weathery
//
//  Created by Shayan on 21/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation

final class WeatherListViewModel {
    var weatherViewModels: [WeatherViewModel]
    
    init() {
        weatherViewModels = [WeatherViewModel]()
    }
}

extension WeatherListViewModel {
    
}

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

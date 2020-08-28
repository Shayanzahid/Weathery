//
//  WeatherEntity-Extension.swift
//  Weathery
//
//  Created by Shayan on 27/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation

extension WeatherEntity {
    
    var toWeather: Weather {
        return Weather(main: WeatherDetail(temp: temperature, tempMin: 0.0, tempMax: 0.0), name: name ?? "")
    }
}

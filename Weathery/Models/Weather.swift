//
//  Weather.swift
//  Weathery
//
//  Created by Shayan on 19/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation

struct WeatherDetail: Codable {
    let temp: Double
}

struct Weather: Codable {
    let main: WeatherDetail
    let name: String
}

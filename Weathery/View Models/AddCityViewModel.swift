//
//  AddCityViewModel.swift
//  Weathery
//
//  Created by Shayan on 21/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation
import Combine

class AddCityViewModel: ObservableObject {
    let weatherPublisher = PassthroughSubject<Result<Weather, APIErrors>, Never>()
    
    func fetchWeather(for city: String) {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=0fa72fbc73a3dd5d5c84e056ec2787de&units=metric") else {
            return
        }
        
        let resource = Resource<Weather>(url: url)
        
        Webservice().load(resource: resource) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                case .success(let weather):
                    self.weatherPublisher.send(.success(weather))
                case .failure(let error):
                    self.weatherPublisher.send(.failure(error))
            }
        }
    }
}

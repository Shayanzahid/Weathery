//
//  Webservice.swift
//  Weathery
//
//  Created by Shayan on 19/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation

enum APIErrors: Error {
    case urlError
    case serverError
    case invalidData
}

struct Resource <T> {
    let url: URL
}

final class Webservice {
    func load<T>(resource: Resource<T>, completion: @escaping (Result<Weather, APIErrors>) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if error != nil {
                completion(.failure(.serverError))
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let weather = try JSONDecoder().decode(Weather.self, from: data)
                        completion(.success(weather))
                    } catch {
                        completion(.failure(.invalidData))
                    }
                }
            }
        }.resume()
    }
}

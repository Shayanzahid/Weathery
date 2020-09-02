//
//  UserDefaults-InputOutput.swift
//  Weathery
//
//  Created by Shayan on 02/09/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation

extension UserDefaults {
    func save(value: Any?, forKey key: UserDefaultKey) {
        set(value, forKey: key.rawValue)
    }
}

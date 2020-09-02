//
//  SettingsViewModel.swift
//  Weathery
//
//  Created by Shayan on 27/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation
import Combine

enum Format: String {
    case metric = "Celsius" // Celsius
    case imperial = "Farenheit" // Farenheit
}

struct SettingsListViewModel {
    private var settingsViewModels = [
        SettingsViewModel(temperatureFormat: .metric),
        SettingsViewModel(temperatureFormat: .imperial)
    ]
    
    let formatSelected = PassthroughSubject<Bool, Never>()
    
    private mutating func addSettingsViewModel(_ vm: SettingsViewModel) {
        settingsViewModels.append(vm)
    }
    
    func numberOfRows(in section: Int) -> Int {
        return settingsViewModels.count
    }
    
    func settingsViewModel(at index: Int) -> SettingsViewModel {
        return settingsViewModels[index]
    }
}

struct SettingsViewModel {
    private let temperatureFormat: Format
    
    init(temperatureFormat: Format) {
        self.temperatureFormat = temperatureFormat
    }
    
    var temperatureFormatType: String {
        return temperatureFormat.rawValue
    }
}

//
//  SettingsViewModel.swift
//  Weathery
//
//  Created by Shayan on 27/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation

enum Format {
    case celsius
    case farenheit
}

struct SettingsListViewModel {
    private var settingsViewModels = [SettingsViewModel]()
    
    mutating func addSettingsViewModel(_ vm: SettingsViewModel) {
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
    let temperatureFormat: Format
}

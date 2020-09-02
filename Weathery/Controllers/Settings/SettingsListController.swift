//
//  SettingsController.swift
//  Weathery
//
//  Created by Shayan on 27/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit
import Combine

protocol SettingsChangedDelegate: class {
    func didSelect(_ settingsViewModel: SettingsViewModel)
}

final class SettingsListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let settingsListView = SettingsListView()
    private let settingsListViewModel = SettingsListViewModel()
    
    weak var delegate: SettingsChangedDelegate?
    
    let publisher = PassthroughSubject<SettingsViewModel, Never>()
    
    override func loadView() {
        view = settingsListView
        settingsListView.settingsListController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsListView.tableView.delegate = self
        settingsListView.tableView.dataSource = self
    }
    
    @objc func doneTapped() {
        delegate?.didSelect(<#T##settingsViewModel: SettingsViewModel##SettingsViewModel#>)
        dismiss(animated: true)
    }
}

extension SettingsListController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        cell?.selectionStyle = .none
        
        let settingsViewModel = settingsListViewModel.settingsViewModel(at: indexPath.row)
        publisher.send(settingsViewModel)
        
        UserDefaults.standard.save(value: settingsViewModel.temperatureFormatType, forKey: .temperatureFormat)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsListViewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        let settingsViewModel = settingsListViewModel.settingsViewModel(at: indexPath.row)
        cell.textLabel?.text = settingsViewModel.temperatureFormatType
        return cell
    }
}

//
//  SettingsController.swift
//  Weathery
//
//  Created by Shayan on 27/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit

final class SettingsListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let settingsListView = SettingsListView()
    private let settingsListViewModel = SettingsListViewModel()
    
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
        dismiss(animated: true)
    }
}

extension SettingsListController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsListViewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.deq
        return UITableViewCell()
    }
}

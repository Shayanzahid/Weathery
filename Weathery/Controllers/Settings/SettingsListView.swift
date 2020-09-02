//
//  SettingsView.swift
//  Weathery
//
//  Created by Shayan on 27/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit

final class SettingsListView: UIView {
    var settingsListController: SettingsListController? {
        didSet {
            settingsListController?.title = "Settings"
            
            settingsListController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: settingsListController, action: #selector(SettingsListController.doneTapped))
        }
    }
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScreen() {
        setupTableView()
    }
    
    private func setupTableView() {
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//
//  AddCityView.swift
//  Weathery
//
//  Created by Shayan on 19/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit

final class AddCityView: UIView {
    var addCityController: AddCityContoller? {
        didSet {
            addCityController?.title = "Add a city"
            saveButton.addTarget(addCityController, action: #selector(AddCityContoller.saveTapped), for: .touchUpInside)
        }
    }
    
    var isCityFieldEmpty: Bool {
        return cityTextField.text!.isEmpty
    }
    
    let cityTextField = UITextField()
    let saveButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        setupScreen()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScreen() {
        setupCityTextField()
        setupSaveButton()
    }
    
    private func setupCityTextField() {
        addSubview(cityTextField)
        
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        cityTextField.borderStyle = .roundedRect
        cityTextField.placeholder = "Type in a city..."
        
        NSLayoutConstraint.activate([
            cityTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            cityTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            cityTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            cityTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSaveButton() {
        addSubview(saveButton)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.layer.cornerRadius = 5
        
        saveButton.backgroundColor = .systemTeal
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

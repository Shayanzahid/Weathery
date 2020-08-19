//
//  AddCityController.swift
//  Weathery
//
//  Created by Shayan on 19/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import UIKit

final class AddCityContoller: UIViewController {
    private let addCityView = AddCityView()
    
    override func loadView() {
        view = addCityView
        addCityView.addCityController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

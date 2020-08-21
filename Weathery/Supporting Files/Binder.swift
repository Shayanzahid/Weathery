//
//  DataBinder.swift
//  Weathery
//
//  Created by Shayan on 21/08/2020.
//  Copyright © 2020 Muhammad Shayan Zahid. All rights reserved.
//

import Foundation

class Binder<T> {
    var value: T {
        didSet {
            listener?(value)
        }
    }

    private var listener: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}

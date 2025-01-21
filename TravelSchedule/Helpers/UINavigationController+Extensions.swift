//
//  UINavigationController+Extensions.swift
//  TravelSchedule
//
//  Created by big stepper on 20.01.2025.
//

import UIKit

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

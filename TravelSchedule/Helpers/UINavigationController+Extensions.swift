//
//  UINavigationController.swift
//  TravelSchedule
//
//  Created by big stepper on 22.01.2025.
//

import UIKit


extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

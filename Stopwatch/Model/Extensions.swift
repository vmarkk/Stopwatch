//
//  Extensions.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//

import Foundation
import UIKit

extension UINavigationController {

    func setShadow() {
        self.navigationBar.layer.masksToBounds = false
        self.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationBar.layer.shadowOpacity = 0.26
        self.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationBar.layer.shadowRadius = 4
    }

}

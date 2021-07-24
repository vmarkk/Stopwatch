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


extension UIButton {
    
    func addGradiant() {
        let GradientLayerName = "gradientLayer"
        
        if let oldlayer = self.layer.sublayers?.filter({$0.name == GradientLayerName}).first {
            oldlayer.removeFromSuperlayer()
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(named: "darkRed")!.cgColor, UIColor(named: "lightRed")!.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1 )
        gradientLayer.frame = self.bounds
        gradientLayer.name = GradientLayerName
        gradientLayer.cornerRadius = gradientLayer.frame.size.height/2
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}



extension UIView {
    
    func roundedCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

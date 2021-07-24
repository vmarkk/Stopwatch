//
//  Spinner.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//

import Foundation
import UIKit

class Spinner: UIView {
    
    
    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: self.frame.size.height/2, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2)-1, clockwise: true)
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.lineWidth = 4
        
        self.layer.addSublayer(shapeLayer)
    }
    
    
    
    func rotate() {
        self.isHidden = false
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 0.6
        rotation.isCumulative = true
        rotation.repeatCount = .infinity
        rotation.isRemovedOnCompletion = false
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    
    
    func stopRotate() {
        self.isHidden = true
        self.layer.removeAllAnimations()
    }
    
    
}

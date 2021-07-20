//
//  RoundTabBar.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 20/07/21.
//

import UIKit

class RoundTabBar: UITabBar {
    
    
    override func draw(_ rect: CGRect) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath().cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        self.layer.insertSublayer(shapeLayer, at: 0)
        self.layer.shadowPath = createPath().cgPath
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 0.15
        
    }
    
    
    
    
    
    func createPath() -> UIBezierPath {
        
       
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 30, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width/2-30, y: 0))
     //   path.addArc(withCenter: CGPoint(x: (self.frame.width/2), y: tabCircleCenterY), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.addLine(to: CGPoint(x: self.frame.width/2+30, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width-30, y: 0))
        path.addArc(withCenter: CGPoint(x: self.frame.width-30, y: 30), radius: 30, startAngle: (.pi/2), endAngle: (0), clockwise: true)
        
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: 30))
        path.addArc(withCenter: CGPoint(x: 30, y: 30), radius: 30, startAngle: (.pi), endAngle: (.pi/2), clockwise: true)
      
        path.close()

        return path
    }
}

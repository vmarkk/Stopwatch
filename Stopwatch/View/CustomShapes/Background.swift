//
//  Background.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//


import Foundation
import UIKit

@IBDesignable
class Background: UIView {
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        
        
        path = UIBezierPath()

    
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height/2.5))
        path.addLine(to: CGPoint(x: 0, y: rect.height/2.5))
     

      
        path.addClip()
        
 
        let colors = [UIColor(named: "darkRed")!.cgColor, UIColor(named: "lightRed")!.cgColor]
        
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        
        let colorLocations:[CGFloat] = [0, 1.0]
        
        
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)
        
        let context = UIGraphicsGetCurrentContext()!
        let startPoint = CGPoint(x: bounds.minX, y: bounds.maxY)
        let endPoint = CGPoint(x: bounds.maxX, y: bounds.minY)
        
     
        context.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions.drawsAfterEndLocation)
        
        
        
    }
    var gradient: CAGradientLayer!
    
    
}






@IBDesignable
class BackgroundWhite: UIView {
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) {
        
        
        path = UIBezierPath()
        let cP2 = CGPoint(x: rect.width/2, y: 0)
        let to = CGPoint(x: rect.width, y: 35)
        
        path.move(to: CGPoint(x: 0, y: 35))
        path.addQuadCurve(to: to, controlPoint: cP2)
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: 35))
        
        
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
      
        path.fill()
        
        
    }
   
    
    
}



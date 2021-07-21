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
        // ORIGINAL VALUE: 30
        let heightValue = rect.height*0.113
        
        let to = CGPoint(x: rect.width/2, y: rect.height)
        let cP2 = CGPoint(x: 0, y: rect.height-heightValue)
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height-heightValue))
        path.addQuadCurve(to: cP2, controlPoint: to)

      
        path.addClip()
        
        // create and add the gradient
        let colors = [UIColor(named: "darkRed")!.cgColor, UIColor(named: "lightRed")!.cgColor]
        
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        
        let colorLocations:[CGFloat] = [0, 1.0]
        
        
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)
        
        let context = UIGraphicsGetCurrentContext()!
        let startPoint = CGPoint(x: bounds.minX, y: bounds.maxY)
        let endPoint = CGPoint(x: bounds.maxX, y: bounds.minY)
        
        // and lastly, draw the gradient.
        context.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions.drawsAfterEndLocation)
        
        
        
    }
    var gradient: CAGradientLayer!
    
    
}



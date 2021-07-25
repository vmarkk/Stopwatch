//
//  Chart.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 25/07/21.
//

import UIKit


class Chart: UIView {
    
    
    var path = UIBezierPath()
    let shapeLayer = CAShapeLayer()
    var lastPoint: CGPoint!
   
  
    
    
    var points = [CGPoint]() {
        didSet {
            addPointToGraph()
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).setStroke()
        
        path.lineCapStyle = .round
        path.stroke()
        path.move(to: CGPoint(x: 0, y: frame.height))
        
        lastPoint = CGPoint(x: 0, y: frame.height)
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineCap = .round
    }
    
   
    
    func addPointToGraph() {
       // circlePath.removeAllPoints()
       
        path.removeAllPoints()
        setNeedsDisplay()
       
      
        
        var currentIndex = 0
        for point in  points {
            
           
            currentIndex += 1
            
            path.move(to: CGPoint(x: lastPoint.x*CGFloat(currentIndex-1), y: lastPoint.y))
            
            path.addLine(to: CGPoint(x: frame.size.width/CGFloat(points.count)*CGFloat(currentIndex), y: frame.size.height-point.y))
            
            lastPoint.x = frame.size.width/CGFloat(points.count)
            
            lastPoint.y = frame.height-point.y
            
            // ADD PIN
          
            var circlePath = UIBezierPath()
            let circleLayer = CAShapeLayer()
      
            circlePath.cgPath = UIBezierPath(ovalIn: CGRect(x: frame.size.width/CGFloat(points.count)*CGFloat(currentIndex)-4, y: frame.size.height-point.y-4, width: 8, height: 8)).cgPath
            circleLayer.path = circlePath.cgPath
         
            layer.addSublayer(circleLayer)
            circlePath.removeAllPoints()
            
            
            // ADD PIN
            
        }
        
        
       
        
        shapeLayer.path = path.cgPath
      
      
      
        
       // circleLayer.setNeedsDisplay()
      
        shapeLayer.setNeedsDisplay()
        
        layer.addSublayer(shapeLayer)
       
    }
    
    
}

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
    
    var circlePaths = [UIBezierPath]()
    var circleLayers = [CAShapeLayer]()
    
    
    func addPointToGraph() {
        
      
        
        for l in circleLayers {
            l.removeFromSuperlayer()
        }
        
        
        for p in circlePaths {
            p.removeAllPoints()
        }
        
        circleLayers.removeAll()
        circlePaths.removeAll()
        
        path.removeAllPoints()
        setNeedsDisplay()
       
        var currentIndex = 0
        for point in  points {
            
            currentIndex += 1
            
            path.move(to: CGPoint(x: lastPoint.x*CGFloat(currentIndex-1), y: lastPoint.y))
            
            path.addLine(to: CGPoint(x: frame.size.width/CGFloat(points.count)*CGFloat(currentIndex), y: frame.size.height-point.y))
            
            lastPoint.x = frame.size.width/CGFloat(points.count)
            
            lastPoint.y = frame.height-point.y
            
           
           
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/CGFloat(points.count)*CGFloat(currentIndex), y: frame.size.height-point.y), radius: 4, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2.0), clockwise: true)
         
       
            circlePaths.append(circlePath)
            
    }
      
        for pathh in circlePaths {
      
            let layerr = CAShapeLayer()
            layerr.path = pathh.cgPath
            
            
            circleLayers.append(layerr)
    

        }
        
        print(circlePaths)
        
     
        
    
        for layerr in circleLayers {
      
            layerr.setNeedsDisplay()
           
            layer.addSublayer(layerr)
            
        }
        
      
        print(circleLayers.count)
        shapeLayer.path = path.cgPath
        shapeLayer.setNeedsDisplay()
        
        layer.addSublayer(shapeLayer)
       
    }
    
    
}


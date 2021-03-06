//
//  SortViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 24/07/21.
//

import UIKit


protocol SortPopUpDelegate {
    func syncSortOption(sortOption: String)
}

class SortViewController: UIViewController {

    
    
    @IBOutlet weak var peakSpeedCheck: UIImageView!
    @IBOutlet weak var numLapsCheck: UIImageView!
    @IBOutlet weak var indicatorView: UIView!
    
    
    private var hasSetPointOrigin = false
    private var pointOrigin: CGPoint?
    var delegate: SortPopUpDelegate?
   
    var sortOption = "peakSpeed"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pan))
        view.addGestureRecognizer(panGesture)
        
        indicatorView.roundedCorners([.allCorners], radius: 2)
        
        checkImage()
        
    }
    
    
    private func checkImage() {
        if sortOption == "totalLaps" {
            peakSpeedCheck.image = UIImage(named: "checkEmpty")
            numLapsCheck.image = UIImage(named: "checkFull")
        } else {
            numLapsCheck.image = UIImage(named: "checkEmpty")
            peakSpeedCheck.image = UIImage(named: "checkFull")
        }
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = view.frame.origin
        }
    }
    
    
    @objc private func pan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        guard translation.y >= 0 else {return}
        
        view.frame.origin = CGPoint(x: 0, y: pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
        
    }
    

    @IBAction func tapLap(_ sender: UITapGestureRecognizer) {
        if sortOption != "totalLaps" {
            self.sortOption = "totalLaps"
            self.checkImage()
            self.delegate!.syncSortOption(sortOption: sortOption)
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tapPeak(_ sender: UITapGestureRecognizer) {
        if sortOption != "peakSpeed" {
            self.sortOption = "peakSpeed"
            self.checkImage()
            self.delegate!.syncSortOption(sortOption: sortOption)
        }
        dismiss(animated: true, completion: nil)
    }
    
}

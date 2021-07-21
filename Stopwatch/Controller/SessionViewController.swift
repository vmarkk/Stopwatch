//
//  SessionViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//

import UIKit

class SessionViewController: UIViewController {
    
    @IBOutlet weak var finishOutlet: UIButton!
    var player: Player?
    var distance: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        
    }
    

    @IBAction func x(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    private func setUpViews() {
        finishOutlet.layer.cornerRadius = finishOutlet.frame.size.height/2
        finishOutlet.layer.borderWidth = 2
        finishOutlet.layer.borderColor = UIColor.white.cgColor
      
    }
    

}

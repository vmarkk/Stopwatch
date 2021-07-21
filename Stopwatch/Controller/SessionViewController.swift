//
//  SessionViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//

import UIKit

class SessionViewController: UIViewController {
    
    var player: Player?
    var distance: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func x(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}

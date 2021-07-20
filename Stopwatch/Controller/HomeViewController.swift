//
//  ViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 20/07/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    private var players: [Player]? {
        didSet {
            print(players!.count)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
      Network.fetchPlayers(completion: { player in
       
    
        })
    }


}


//
//  ViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 20/07/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var playersTV: UITableView!
    
    
    private var players = [Player]() {
        didSet {
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Network.fetchPlayers(completion: { player in
            self.players.insert(player, at: 0)
            
            self.playersTV.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        })
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellPlayer") as? PlayerTVCell else { return UITableViewCell() }
        
        return cell
    }

}


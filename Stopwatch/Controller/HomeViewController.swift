//
//  ViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 20/07/21.
//

import UIKit
import SDWebImage


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var spinner: Spinner!
    @IBOutlet weak var playersTV: UITableView!

    private var selectedPlayer: Player?
  
    
    private var players = [Player]() {
        didSet {
            self.playersTV.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            
            if players.count == 1 {
                self.spinner.stopRotate()
            }
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        spinner.rotate()
        
        playersTV.register(UINib(nibName: "PlayerTVCell", bundle: nil), forCellReuseIdentifier: "cellPlayer")
        

        Network.fetchPlayers(completion: { player in
            self.players.insert(player, at: 0)
        })
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setShadow()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellPlayer") as? PlayerTVCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none

        let player = players[indexPath.row]
        var sex = ""

        if player.name.title == "Mr" {
            sex = "Male"
            cell.sexPlayerImage.image = UIImage(named: "male")
        } else {
            sex = "Female"
            cell.sexPlayerImage.image = UIImage(named: "female")
        }

        cell.namePlayer.text = "\(player.name.first) \(player.name.last)"
        cell.sexPlayer.text = sex

        cell.imageProfile.layer.cornerRadius = cell.imageProfile.frame.size.height/2
        cell.imageContainer.layer.cornerRadius = cell.imageContainer.frame.size.height/2
        cell.imageContainer.layer.shadowColor = UIColor.black.cgColor
        cell.imageContainer.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.imageContainer.layer.shadowRadius = 10
        cell.imageContainer.layer.shadowOpacity = 0.2
        
        cell.imageProfile.sd_setImage(with: URL(string: player.picture.large)) { image, err, cache, url in
            if let userImage = image {
                cell.imageProfile.image = userImage
            }
        }
        
        if indexPath.row == players.count-1 {
            cell.separatorView.isHidden = true
        } else {
            cell.separatorView.isHidden = false
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        selectedPlayer = players[indexPath.row]

        performSegue(withIdentifier: "goSettings", sender: self)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let backItem = UIBarButtonItem()
           backItem.title = ""
           navigationItem.backBarButtonItem = backItem

        if segue.destination is SettingsViewController {
            if let vc = segue.destination as? SettingsViewController {

                vc.player = selectedPlayer
            }
        }
    }
}


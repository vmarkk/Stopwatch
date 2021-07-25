//
//  LeaderboardViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//

import UIKit
import RealmSwift

class LeaderboardViewController: UIViewController, SortPopUpDelegate, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var noSessionFoundLabel: UILabel!
    @IBOutlet weak var leaderTV: UITableView!

    
    private let refreshControl = UIRefreshControl()
   
    private var players: Results<PlayerRealm>? {
        didSet {
            
            DispatchQueue.main.async {
                self.leaderTV.reloadData()
                
                guard self.noSessionFoundLabel != nil else {return}
                if self.players!.count > 0 && !self.noSessionFoundLabel.isHidden {
                    UIView.animate(withDuration: 0.13) {
                        self.noSessionFoundLabel.alpha = 0
                    } completion: { _ in
                        self.noSessionFoundLabel.removeFromSuperview()
                    }
                }
                
            }
           
        }
    }
    
    
    private var sortOption = "peakSpeed"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        leaderTV.register(UINib(nibName: "LeaderTVCell", bundle: nil), forCellReuseIdentifier: "cellLeader")
        leaderTV.tableFooterView = UIView()
        
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        leaderTV.addSubview(refreshControl)
        leaderTV.contentInsetAdjustmentBehavior = .always
        
        navigationController?.setShadow()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        players = try! Realm().objects(PlayerRealm.self).sorted(byKeyPath: sortOption, ascending: false)
        
    }
    
    
    @objc private func refresh() {
        
        if refreshControl.isRefreshing {
            
            players = try! Realm().objects(PlayerRealm.self).sorted(byKeyPath: sortOption, ascending: false)
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                self.refreshControl.endRefreshing()
            }
        }
    }
    

    @IBAction func sort(_ sender: UIButton) {
        
        let sortView = SortViewController()
        sortView.sortOption = sortOption
        sortView.modalPresentationStyle = .custom
        sortView.delegate = self
        sortView.transitioningDelegate = self
        present(sortView, animated: true, completion: nil)
    }
    
    
    func syncSortOption(sortOption: String) {
        
        if sortOption != self.sortOption {
            if players != nil {
                players = players!.sorted(byKeyPath: sortOption, ascending: false)
            
                DispatchQueue.main.async {
                    self.leaderTV.reloadData()
                }
            
            }
        }
        
        self.sortOption = sortOption
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellLeader") as? LeaderTVCell else { return UITableViewCell() }
        
        cell.background.layer.cornerRadius = 20
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.height/2
        
        guard players != nil else {
            return UITableViewCell()
        }
        
        let player = players![indexPath.row]
        
        cell.leaderNum.text = "\(indexPath.row+1)"
        cell.namePlayer.text = player.fullName
        
        var peakSpeedString = String(format: "%.1f", player.peakSpeed)
        
        if peakSpeedString.last == "0" {
            peakSpeedString = String(peakSpeedString.dropLast(2))
        }
        
        
        cell.explValue.text = "\(peakSpeedString) m/s"
        cell.lapsValue.text = "\(player.totalLaps)"
        
        cell.profileImage.sd_setImage(with: URL(string: player.pictureUrl)) { image, err, cache, url in
            
        
            guard image != nil else {return}
            
            cell.profileImage.image = image
        }
        
        
        if sortOption == "peakSpeed" {
            cell.explValue.font = UIFont.systemFont(ofSize: 11, weight: .bold)
            cell.explValue.textColor = .black
            cell.explIcon.tintColor = .black
            
            cell.lapsValue.font = UIFont.systemFont(ofSize: 11, weight: .medium)
            cell.lapsValue.textColor = UIColor(named: "labelGray")
            cell.lapsIcon.tintColor = UIColor(named: "labelGray")
            
        } else {
            cell.lapsValue.font = UIFont.systemFont(ofSize: 11, weight: .bold)
            cell.lapsValue.textColor = .black
            cell.lapsIcon.tintColor = .black
            
            cell.explValue.font = UIFont.systemFont(ofSize: 11, weight: .medium)
            cell.explValue.textColor = UIColor(named: "labelGray")
            cell.explIcon.tintColor = UIColor(named: "labelGray")
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}




extension LeaderboardViewController: UIViewControllerTransitioningDelegate {

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
       SortPresentationPopView(presentedViewController: presented, presenting: presented)
    }
}

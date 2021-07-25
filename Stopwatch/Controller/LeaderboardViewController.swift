//
//  LeaderboardViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//

import UIKit
import RealmSwift

class LeaderboardViewController: UIViewController, SortPopUpDelegate, UITableViewDelegate, UITableViewDataSource {
   
  
    @IBOutlet weak var leaderTV: UITableView!

   
    private let players = try! Realm().objects(PlayerRealm.self)
    private var sortOption = "peak"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

        print(players.count)
    
        leaderTV.register(UINib(nibName: "LeaderTVCell", bundle: nil), forCellReuseIdentifier: "cellLeader")
        leaderTV.tableFooterView = UIView()
        
        navigationController?.setShadow()
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
        self.sortOption = sortOption
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellLeader") as? LeaderTVCell else { return UITableViewCell() }
        
        cell.background.layer.cornerRadius = 20
        
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

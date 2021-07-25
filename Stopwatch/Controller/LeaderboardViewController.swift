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
    private var sortOption = "laps"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

        print(players.count)
    
        leaderTV.register(UINib(nibName: "LeaderTVCell", bundle: nil), forCellReuseIdentifier: "cellLeader")
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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellLeader") as? LeaderTVCell else { return UITableViewCell() }
        
        return cell
    }
    
    

}




extension LeaderboardViewController: UIViewControllerTransitioningDelegate {

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
       SortPresentationPopView(presentedViewController: presented, presenting: presented)
    }
}

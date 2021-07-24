//
//  LeaderboardViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//

import UIKit
import RealmSwift

class LeaderboardViewController: UIViewController {
    
   // private let players = try! Rea

    private var sortOption = "laps"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setShadow()
    }
    

    @IBAction func sort(_ sender: UIButton) {
        
        let sortView = SortViewController()
        sortView.sortOption = "laps"
        sortView.modalPresentationStyle = .custom
        sortView.transitioningDelegate = self
        present(sortView, animated: true, completion: nil)
    }
    
    


}




extension LeaderboardViewController: UIViewControllerTransitioningDelegate {

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
       SortPresentationPopView(presentedViewController: presented, presenting: presented)
    }
}

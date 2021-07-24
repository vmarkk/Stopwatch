//
//  LeaderboardViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//

import UIKit

class LeaderboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setShadow()
    }
    

    @IBAction func sort(_ sender: UIButton) {
        
        let sortView = SortViewController()
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

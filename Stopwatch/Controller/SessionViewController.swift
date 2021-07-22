//
//  SessionViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//

import UIKit

class SessionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var lapOutlet: UIButton!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var finishOutlet: UIButton!
    var player: Player?
    var distance: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.contentInset.top = 250
        
        setUpViews()
        
        if distance != nil {
            titleView.text = "\(distance!) m"
        }
    }
    

    @IBAction func x(_ sender: UIButton) {
        alert()
    }
    
    
    private func dismiss() {
        NotificationCenter.default.post(name: Notification.Name("popView"), object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    
    private func setUpViews() {
        finishOutlet.layer.cornerRadius = finishOutlet.frame.size.height/2
        finishOutlet.layer.borderWidth = 2
        finishOutlet.layer.borderColor = UIColor.white.cgColor
        lapOutlet.layer.cornerRadius = lapOutlet.frame.size.height/2
    }
    
    
    private func alert(finish: Bool = true) {
        
        let alert = UIAlertController(title: "Stop session", message: "Are you sure to end this session?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Terminate", style: .default) { _ in
            
            self.dismiss()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("")
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    

}

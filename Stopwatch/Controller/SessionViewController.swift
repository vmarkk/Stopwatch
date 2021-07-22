//
//  SessionViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//

import UIKit

class SessionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var lapOutlet: UIButton!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var finishOutlet: UIButton!
    
    
    var player: Player?
    var distance: String?
    private var timer = Timer()
    private var count = 0
    private var isCounting = false {
        didSet {
            if isCounting {
                UIView.animate(withDuration: 0.1) {
                    self.lapOutlet.setTitle("LAP", for: .normal)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.contentInset.top = 150
        
        setUpViews()
        
        if distance != nil {
            titleView.text = "\(distance!) m"
        }
        
      
    }
    
    
    @objc private func startTimer() {
        count += 1
        let time = secondsToMinuteSecondsCents(seconds: count)
        let timeString = timeString(minutes: time.0, seconds: time.1, cents: time.2)
        timerLabel.text = timeString
    }
    
    private func secondsToMinuteSecondsCents(seconds: Int) -> (Int, Int, Int) {
        return ((seconds/3600), ((seconds % 3600)/60), (seconds%3600)%60)
    }
    
    
    private func timeString(minutes: Int, seconds: Int, cents: Int) -> String {
        var timeString = ""
        
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        timeString += ":"
        timeString += String(format: "%02d", cents)
        
        return timeString
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
    
    @IBAction func lapTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.12) {
            self.lapOutlet.transform = CGAffineTransform(scaleX: 0.94, y: 0.94)
        }
    }
    
    @IBAction func lapTouchCancel(_ sender: UIButton) {
        UIView.animate(withDuration: 0.12) {
            self.lapOutlet.transform = .identity
        }
    }
    
    @IBAction func lapDragExit(_ sender: UIButton) {
        UIView.animate(withDuration: 0.12) {
            self.lapOutlet.transform = .identity
        }
    }
    
    @IBAction func lapDragOut(_ sender: UIButton) {
        UIView.animate(withDuration: 0.12) {
            self.lapOutlet.transform = .identity
        }
    }
    
    
    @IBAction func lap(_ sender: UIButton) {
        UIView.animate(withDuration: 0.12) {
            self.lapOutlet.transform = .identity
        }
        
        isCounting = true
        count = 0
        timer.invalidate()
        if isCounting {
            
            timer = Timer.scheduledTimer(timeInterval: 1/60,
                target: self,
                selector: #selector(startTimer),
                userInfo: nil,
                repeats: true)
        } 
        
       
    }
    
    @IBAction func lapTouchUpOut(_ sender: UIButton) {
        UIView.animate(withDuration: 0.12) {
            self.lapOutlet.transform = .identity
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
}

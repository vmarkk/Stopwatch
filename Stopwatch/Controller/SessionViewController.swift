//
//  SessionViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//

import UIKit

class SessionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var lapTVHeight: NSLayoutConstraint!
    @IBOutlet weak var lapTV: UITableView!
    @IBOutlet weak var centsLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var lapOutlet: UIButton!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var finishOutlet: UIButton!
    
    
    var player: Player?
    var distance: String?
    private var timer = Timer()
    private var count = 0
    private var laps = [Lap]() {
        didSet {

            print(laps[0])
            DispatchQueue.main.async {
                self.lapTV.insertRows(at: [IndexPath(row: 0, section: 0)], with: .left)

            }
        }
    }


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
        scroll.contentInset.bottom = lapOutlet.frame.size.height+15

        lapTV.register(UINib(nibName: "LapTVCell", bundle: nil), forCellReuseIdentifier: "cellLap")

        lapTV.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        
        setUpViews()
        
        if distance != nil {
            titleView.text = "\(distance!) m"
        }
        
      
    }
    
    
    @objc private func startTimer() {
        count += 1
   
        minutesLabel.text = String(format: "%02d", secondsToMinuteSecondsCents(seconds: count).0)
        
        secondsLabel.text = String(format: "%02d", secondsToMinuteSecondsCents(seconds: count).1)
        
        centsLabel.text = String(format: "%02d", secondsToMinuteSecondsCents(seconds: count).2)
    }


    private func startTiming() {
        timer = Timer.scheduledTimer(timeInterval: 0.01,
            target: self,
            selector: #selector(startTimer),
            userInfo: nil,
            repeats: true)

        RunLoop.main.add(timer, forMode: .common)

    }
    
    private func secondsToMinuteSecondsCents(seconds: Int) -> (Int, Int, Int) {
        return ((seconds/3600), ((seconds % 3600)/100), (seconds)%100)
    }
    
    

    @IBAction func x(_ sender: UIButton) {
        timer.invalidate()
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

            self.startTiming()
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


    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let obj = object as? UITableView {
            if obj == self.lapTV && keyPath == "contentSize" {
                if let newSize = change?[NSKeyValueChangeKey.newKey] as? CGSize {
                    self.lapTVHeight.constant = newSize.height
                }
            }
        }
    }
    
    
    @IBAction func lap(_ sender: UIButton) {
        UIView.animate(withDuration: 0.12) {
            self.lapOutlet.transform = .identity
        }
        
        isCounting = true

        timer.invalidate()

        if isCounting {


            self.addLap()
            
            self.startTiming()

        } 
        
       
    }
    
    @IBAction func lapTouchUpOut(_ sender: UIButton) {
        UIView.animate(withDuration: 0.12) {
            self.lapOutlet.transform = .identity
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellLap") as? LapTVCell else { return UITableViewCell() }

        let lap = laps[indexPath.row]

        cell.lapNumber.text = "\(lap.lapNumber)"

        if distance != nil {

            if lap.seconds > 0 {
                let metersPerSecond: Double = Double(Int(distance!)!/lap.seconds)

                print("numm \(Int(distance!)!)  \(lap.seconds)")
            cell.lapSpeed.text = "\(metersPerSecond) m/s"
            } else {
                cell.lapSpeed.text = "2 m/s"
            }
        }

        cell.selectionStyle = .none
        cell.shadow.backgroundColor = .white
        cell.shadow.layer.cornerRadius = 18
        cell.shadow.layer.shadowColor = UIColor.black.cgColor
        cell.shadow.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.shadow.layer.shadowRadius = 7
        cell.shadow.layer.shadowOpacity = 0.12


        return cell
    }


    private func addLap() {
        let lapMinutes = secondsToMinuteSecondsCents(seconds: count).0

        let lapSeconds = secondsToMinuteSecondsCents(seconds: count).1

        let lapCents = secondsToMinuteSecondsCents(seconds: count).2

        let lap = Lap(lapNumber: laps.count+1, minutes: lapMinutes, seconds: lapSeconds, cents: lapCents)

        laps.insert(lap, at: 0)

        count = 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
}

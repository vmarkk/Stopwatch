//
//  SettingsViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var startOutlet: UIButton!
    @IBOutlet weak var distanceTxtField: UITextField!

    
    private let accessoryToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
    private var accessoryDoneButton: UIBarButtonItem!
    var player: Player?
    private var distance = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setKeyboardToolbar()
        setTapGesture()

        distanceTxtField.becomeFirstResponder()
        
      
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "\(player?.name.first ?? "") \(player?.name.last ?? "")"
    }

    
    
    override func viewDidLayoutSubviews() {
        setUpViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


    }
    
    
    

    private func setUpViews() {
        startOutlet.addGradiant()
        startOutlet.layer.cornerRadius = startOutlet.frame.size.height/2
    }


    private func setTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(donePressed))
        view.addGestureRecognizer(tap)
    }



    private func setKeyboardToolbar() {
        accessoryDoneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(donePressed))
        accessoryToolBar.items = [self.accessoryDoneButton]
        distanceTxtField.inputAccessoryView = self.accessoryToolBar
    }




    @objc private func donePressed() {
        view.endEditing(true)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        let currentText = textField.text ?? ""

        guard let stringRange = Range(range, in: currentText) else { return false }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        distance = updatedText
        
        // I DECIDED TO LIMIT DISTANCE DIGITS TO 4
        return updatedText.count <= 4
    }
    
    
    @IBAction func start(_ sender: UIButton) {

        UIView.animate(withDuration: 0.12) {
            self.startOutlet.transform = .identity
        }
    }
    
    @IBAction func startCancel(_ sender: UIButton) {
        UIView.animate(withDuration: 0.12) {
            self.startOutlet.transform = .identity
        }
    }
    
    @IBAction func startTouchDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.12) {
            self.startOutlet.transform = CGAffineTransform(scaleX: 0.93, y: 0.93)
        }
    }
    
    @IBAction func startDragExit(_ sender: UIButton) {
        UIView.animate(withDuration: 0.12) {
            self.startOutlet.transform = .identity
        }
    }
    
    @IBAction func touchDragOutside(_ sender: UIButton) {
        UIView.animate(withDuration: 0.12) {
            self.startOutlet.transform = .identity
        }
    }
    
    @IBAction func startTouchUpOutside(_ sender: UIButton) {
        UIView.animate(withDuration: 0.12) {
            self.startOutlet.transform = .identity
        }
    }
}




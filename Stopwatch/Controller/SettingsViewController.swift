//
//  SettingsViewController.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 21/07/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var distanceTxtField: UITextField!

    private let accessoryToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
    private var accessoryDoneButton: UIBarButtonItem!
    var player: Player?

    override func viewDidLoad() {
        super.viewDidLoad()

        setKeyboardToolbar()
        setTapGesture()

        distanceTxtField.becomeFirstResponder()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = player?.name.first
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


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
}

//
//  LapTVCell.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 22/07/21.
//

import UIKit

class LapTVCell: UITableViewCell {

    @IBOutlet weak var lapSpeed: UILabel!
    @IBOutlet weak var lapTime: UILabel!
    @IBOutlet weak var lapNumber: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

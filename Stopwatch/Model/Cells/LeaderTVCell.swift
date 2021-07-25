//
//  LeaderTVCell.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 24/07/21.
//

import UIKit

class LeaderTVCell: UITableViewCell {
    
    @IBOutlet weak var lapsValue: UILabel!
    @IBOutlet weak var lapsTitle: UILabel!
    @IBOutlet weak var lapsIcon: UIImageView!
    @IBOutlet weak var explValue: UILabel!
    @IBOutlet weak var explTitle: UILabel!
    @IBOutlet weak var explIcon: UIImageView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var namePlayer: UILabel!
    @IBOutlet weak var leaderNum: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }
    
}

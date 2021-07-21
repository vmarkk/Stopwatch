//
//  PlayerTVCell.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 20/07/21.
//

import UIKit

class PlayerTVCell: UITableViewCell {

    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var sexPlayerImage: UIImageView!
    @IBOutlet weak var sexPlayer: UILabel!
    @IBOutlet weak var namePlayer: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            contentView.backgroundColor = .gray
        } else {
            contentView.backgroundColor = .white
        }
    }
    
}

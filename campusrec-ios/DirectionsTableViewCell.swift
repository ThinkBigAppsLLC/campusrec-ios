//
//  DirectionsTableViewCell.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/20/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit

class DirectionsTableViewCell: UITableViewCell {

    @IBOutlet var directionButton: UIButton!
    @IBOutlet var directionLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

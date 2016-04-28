//
//  NumberTableViewCell.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/20/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit

class NumberTableViewCell: UITableViewCell {

    @IBOutlet var numberButton: UIButton!
    @IBOutlet var callLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    var parentViewController : HomeDetailViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  TextTableViewCell.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/27/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupHeaderLabel(str: String) {
        
        let NSstr = str as NSString
        var checkFirst = true
        var firstWord = ""
        var secondWord = ""
        for character in str.characters{
            if character == " " {
                checkFirst = false
            }
            else if checkFirst == true {
                firstWord.append(character)
            }
            else {
                secondWord.append(character)
            }
            
        }
        
        let noSpaceString = firstWord + secondWord
        let NSnoSpaceString = noSpaceString as NSString
        var attributedString = NSMutableAttributedString(string: noSpaceString, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(15.0)])
        
        let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFontOfSize(15.0)]
        
        attributedString.addAttributes(boldFontAttribute, range: NSnoSpaceString.rangeOfString(secondWord))
        
        
        self.headerLabel.attributedText = attributedString
    }

}

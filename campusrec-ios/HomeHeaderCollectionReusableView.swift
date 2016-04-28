//
//  HomeHeaderCollectionReusableView.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/27/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit

class HomeHeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var phoneButton: UIButton!

    @IBOutlet var phoneNumberLabel: UILabel!
    
    func setUpHeaderLabel(str: String, size : CGFloat) {
        
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
        var attributedString = NSMutableAttributedString(string: noSpaceString, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(size)])
        
        let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFontOfSize(size)]
        
        attributedString.addAttributes(boldFontAttribute, range: NSnoSpaceString.rangeOfString(secondWord))
        
        self.categoryLabel.attributedText = attributedString
    }

    
    
    @IBAction func phoneButtonPressed(sender: UIButton) {
        callNumber("8506457246")
    }
    
}

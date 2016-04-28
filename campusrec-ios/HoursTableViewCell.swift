//
//  HoursTableViewCell.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/20/15.
//  Copyright © 2015 ThinkBig Applications. All rights reserved.
//

import UIKit

class HoursTableViewCell: UITableViewCell {

    @IBOutlet var hoursLabel: UILabel!
    
    @IBOutlet var sundayLabel: UILabel!
    @IBOutlet var mondayLabel: UILabel!
    @IBOutlet var tuesdayLabel: UILabel!
    @IBOutlet var wednesdayLabel: UILabel!
    @IBOutlet var thursdayLabel: UILabel!
    @IBOutlet var fridayLabel: UILabel!
    @IBOutlet var saturdayLabel: UILabel!
    
    
    @IBOutlet var sundayHoursLabel: UILabel!
    @IBOutlet var mondayHoursLabel: UILabel!
    @IBOutlet var tuesdayHoursLabel: UILabel!
    @IBOutlet var wednesdayHoursLabel: UILabel!
    @IBOutlet var thursdayHoursLabel: UILabel!
    @IBOutlet var fridayHoursLabel: UILabel!
    @IBOutlet var saturdayHoursLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    func boldCurrentDay() {
        let thisDay = NSDate().dayOfWeek()
        if thisDay != nil {
            switch thisDay! {
            case 1:
                sundayLabel.font = UIFont.boldSystemFontOfSize(15.0)
                sundayHoursLabel.font = UIFont.boldSystemFontOfSize(15.0)
                break
            case 2:
                sundayLabel.font = UIFont.boldSystemFontOfSize(15.0)
                mondayHoursLabel.font = UIFont.boldSystemFontOfSize(15.0)
                break
            case 3:
                tuesdayLabel.font = UIFont.boldSystemFontOfSize(15.0)
                tuesdayHoursLabel.font = UIFont.boldSystemFontOfSize(15.0)
                break
            case 4:
                wednesdayLabel.font = UIFont.boldSystemFontOfSize(15.0)
                wednesdayHoursLabel.font = UIFont.boldSystemFontOfSize(15.0)
                break
            case 5:
                thursdayLabel.font = UIFont.boldSystemFontOfSize(15.0)
                thursdayHoursLabel.font = UIFont.boldSystemFontOfSize(15.0)
                break
            case 6:
                fridayLabel.font = UIFont.boldSystemFontOfSize(15.0)
                fridayHoursLabel.font = UIFont.boldSystemFontOfSize(15.0)
                break
            case 7:
                saturdayLabel.font = UIFont.boldSystemFontOfSize(15.0)
                saturdayHoursLabel.font = UIFont.boldSystemFontOfSize(15.0)
                break
            default:
                break
                
            }
        }
    }
    
    
    func setupCategoryLabel(str: String) {
        
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
        
        
        self.hoursLabel.attributedText = attributedString
    }

}

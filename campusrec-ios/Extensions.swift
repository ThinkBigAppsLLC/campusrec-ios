//
//  Extensions.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/6/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import Foundation
import UIKit

//***************************************************
// MARK: - UIColor
//***************************************************

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /**
     Method to allow hex codes in  UIColor
     
     @param: int
     
     @return : UIColor created
     
     */
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

//***************************************************
// MARK: - String
//***************************************************


extension String
{
    func replace(target: String, withString: String) -> String
    {
        return self.stringByReplacingOccurrencesOfString(target, withString: withString, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    func stripAfterCharacter(rawString : String, char : Character) -> String {
        if let charIndex = rawString.characters.indexOf("-") {
            //Gets text before "-"
            let range = rawString.startIndex..<charIndex.advancedBy(-1)
            let modifiedSubstring = rawString.substringWithRange(range)
            //Set label
            return modifiedSubstring
        }
        else {
            return rawString
        }
        
    }
    
}

//***************************************************
// MARK: - NSDate
//***************************************************


extension NSDate
{
    func hour() -> Int
    {
        //Get Hour
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Hour, fromDate: self)
        let hour = components.hour
        
        //Return Hour
        return hour
    }
    
    
    func minute() -> Int
    {
        //Get Minute
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Minute, fromDate: self)
        let minute = components.minute
        
        //Return Minute
        return minute
    }
    
    func toShortTimeString() -> String
    {
        //Get Short Time String
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self)
        
        //Return Short Time String
        return timeString
    }



    func dayOfWeek() -> Int? {
        if
            let cal: NSCalendar = NSCalendar.currentCalendar(),
            let comp: NSDateComponents = cal.components(.Weekday, fromDate: self) {
            return comp.weekday
        } else {
            return nil
        }
    }
    
}

//***************************************************
// MARK: - Helper Functions
//***************************************************



func removeFromString(toRemove : String, stringToManipulate : String) -> String {
    let returnString = stringToManipulate.stringByReplacingOccurrencesOfString(toRemove, withString: "")
    return returnString
}


func addSideBarSlideout(viewController : UIViewController, button : UIBarButtonItem) -> Void {
    
    if viewController.revealViewController() != nil {
        button.target = viewController.revealViewController()
        button.action = "revealToggle:"
        viewController.view.addGestureRecognizer(viewController.revealViewController().panGestureRecognizer())
    }
}


func isOpen(locationIndex : Int, currentDay : Int) -> Bool {
    

    
    let hour = NSCalendar.currentCalendar().component(.Hour, fromDate: NSDate())
    let minute = NSCalendar.currentCalendar().component(.Minute, fromDate: NSDate())
    //Get closed hour/second as strings
    let thisLocation = LOCATION_INFO[locationIndex]
    let openHours = thisLocation[1]
    let closedHours = thisLocation[2]
    let todayOpenHour = openHours.objectAtIndex(currentDay) as! String
    let todayClosedHour = closedHours.objectAtIndex(currentDay) as! String
    
    //If closed returns false
    if todayOpenHour == "Closed" {
        return false
    }
        
    //If the time is based on sunrise/sunset
    if todayOpenHour == "Sunrise"{
        if hour > 9 && hour < 20 {
            return true
        }
        return false
    }
    
    
    //Change format to HH:mm
    let timeFormat = NSDateFormatter()
    timeFormat.dateFormat = "HH:mm"
    var openHoursDate = timeFormat.dateFromString(todayOpenHour)
    var closedHoursDate = timeFormat.dateFromString(todayClosedHour)
    
    //Get hour and minutes from open hour
    let calendar = NSCalendar.currentCalendar()
    let openHourComponents = calendar.components(.Hour, fromDate: openHoursDate!)
    let openHour = openHourComponents.hour
    let openMinuteComponents = calendar.components(.Minute, fromDate: openHoursDate!)
    let openMinute = openMinuteComponents.minute
    
    //Get hour and minutes from closed hour
    let closedHourComponents = calendar.components(.Hour, fromDate: closedHoursDate!)
    let closedHour = closedHourComponents.hour
    let closedMinuteComponents = calendar.components(.Minute, fromDate: closedHoursDate!)
    let closedMinute = openMinuteComponents.minute
    
    //current hour is earlier than the hour the facility opens
    if hour < openHour {
        return false
    }
    //current hour is the same hour that the facility opens
    else if hour == openHour {
        if minute < openMinute {
            return false
        }
        else {
            return true
        }
    }
    //current hour is later than the hour the facility opens
    else {
        //it is earlier than close hour
        if hour < closedHour {
            return true
        }
        //If minute is before minute the facility closes, it is open
        else if hour == closedHour {
            if minute < closedMinute {
                return true
            }
            else {
                return false
            }
        }
        //it is later than when facility closes
        else {
            return false
        }
    }
}



func callNumber(phoneNumber:String) {
    if let phoneCallURL:NSURL = NSURL(string: "tel://\(phoneNumber)") {
        let application:UIApplication = UIApplication.sharedApplication()
        if (application.canOpenURL(phoneCallURL)) {
            application.openURL(phoneCallURL);
        }
    }
}



func secondWordBolded(str : String, size: CGFloat) -> NSAttributedString {
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
    
    
    return attributedString

}


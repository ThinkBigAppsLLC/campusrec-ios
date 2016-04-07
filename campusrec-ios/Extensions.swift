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

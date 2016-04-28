//
//  Location.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/14/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import Foundation

class Location {
    //static public LocationStatus = LocationStatus()
    
    
    //***************************************************
    // MARK: - Variables
    //***************************************************
    
    //MARK: Meta Details
    var locationName : String!
    var locationImage : String!
    var phoneNumber : String?
    
    //MARK: Hours
    var openHours : [Int] = []
    var closedHours : [Int] = []
    
    //MARK: Address
    var street : String?
    var city : String?
    var zipCode : String?
    
    
    
    
    
    func shouldBeOpen() -> Bool {
        let currentHour = NSCalendar.currentCalendar().component(.Hour, fromDate: NSDate())
        let currentDay = NSCalendar.currentCalendar().component(.Weekday, fromDate: NSDate())
        
        
        let openToday = openHours[currentDay]
        let closedToday = closedHours[currentDay]
        if currentHour >= openToday && currentHour < closedToday {
            return true
        }
        else {
            return false
        }
    }
}

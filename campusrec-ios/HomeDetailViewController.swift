//
//  HomeDetailViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/20/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit
import MapKit

class HomeDetailViewController:
UITableViewController{
    
    
    //***************************************************
    // MARK: - Outlets and Variables
    //***************************************************
    var titleString : String!
    var locationIndex : Int!
    
    var latitude : Double!
    var longitude : Double!
    
    var number: String!
    //***************************************************
    // MARK: - View Setup
    //***************************************************


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 85.0
        tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.rowHeight = UITableViewAutomaticDimension
        self.title = titleString
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //***************************************************
    // MARK: - Table View Functions
    //***************************************************
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("mapCell", forIndexPath: indexPath) as! MapTableViewCell
            cell.parentViewController = self
            cell.setupMap(LOCATION_INFO[locationIndex][3] as! String)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("directionsCell", forIndexPath: indexPath) as! DirectionsTableViewCell
            cell.addressLabel.text = LOCATION_INFO[locationIndex][3] as! String
            cell.backgroundColor = UIColor(netHex: 0xEAEAEA)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("numberCell", forIndexPath: indexPath) as! NumberTableViewCell
            cell.parentViewController = self
            number = LOCATION_INFO[locationIndex][4] as! String
            let s = number
            let s2 = String(format: "(%@) %@-%@", s.substringToIndex(s.startIndex.advancedBy(3)),
                            s.substringWithRange(s.startIndex.advancedBy(3) ... s.startIndex.advancedBy(5)),
                            s.substringWithRange(s.startIndex.advancedBy(6) ... s.startIndex.advancedBy(9))
                            //s.substringWithRange(s.startIndex.advancedBy(6) ... s.startIndex.advancedBy(9))
            )
            cell.numberLabel.text = s2
            cell.backgroundColor = UIColor(netHex: 0xEAEAEA)

            return cell
        case 3:
            let cell = tableView.dequeueReusableCellWithIdentifier("hoursCell", forIndexPath: indexPath) as! HoursTableViewCell
            cell.setupCategoryLabel("Operating Hours")
            
            let thisLocation = LOCATION_INFO[locationIndex]
            let openHours = thisLocation[1]
            let closedHours = thisLocation[2]
            
            
            
            cell.sundayHoursLabel.text = "\(openHours.objectAtIndex(0) as! String) - \(closedHours.objectAtIndex(0) as! String) "
            cell.mondayHoursLabel.text = "\(openHours.objectAtIndex(1) as! String) - \(closedHours.objectAtIndex(1) as! String) "
            cell.tuesdayHoursLabel.text = "\(openHours.objectAtIndex(2) as! String) - \(closedHours.objectAtIndex(2) as! String) "
            cell.wednesdayHoursLabel.text = "\(openHours.objectAtIndex(3) as! String) - \(closedHours.objectAtIndex(3) as! String) "
            cell.thursdayHoursLabel.text = "\(openHours.objectAtIndex(4) as! String) - \(closedHours.objectAtIndex(4) as! String) "
            cell.fridayHoursLabel.text = "\(openHours.objectAtIndex(5) as! String) - \(closedHours.objectAtIndex(5) as! String) "
            cell.saturdayHoursLabel.text = "\(openHours.objectAtIndex(6) as! String) - \(closedHours.objectAtIndex(6) as! String) "
            cell.boldCurrentDay()
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("numberCell", forIndexPath: indexPath)
            return cell
        }
     }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 1 {
         
            
            let lat : CLLocationDegrees =  self.latitude
            let long : CLLocationDegrees =  self.longitude
            
            let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(lat, long)
            let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(MKCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(MKCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = "\(self.titleString)"
            mapItem.openInMapsWithLaunchOptions(options)
        }
        if indexPath.row == 2 {
            callNumber(number)
        }
    }
   


    
    
    //***************************************************
    // MARK: - Menu Bar Actions
    //***************************************************
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

}

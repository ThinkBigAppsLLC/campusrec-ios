//
//  HomeViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/6/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit
import TwitterKit


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //***************************************************
    // MARK: - Variables and Outlets
    //***************************************************

    
    @IBOutlet var menuButton: UIBarButtonItem!
    
    
    @IBOutlet var statusView: UIView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    
    @IBOutlet var rainlineView: UIView!
    @IBOutlet var rainlineLabel: UILabel!

    
    var selectedIndexPathRow : Int?
    //***************************************************
    // MARK: - View Management
    //***************************************************

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create the unfocused view, which is a semi-opaque film that focuses the menu
        statusView.layer.shouldRasterize = false
        statusView.layer.shadowColor = UIColor.blackColor().CGColor
        statusView.layer.shadowOpacity = 1
        statusView.layer.shadowOffset = CGSizeZero
        statusView.layer.shadowRadius = 3
        //statusView.layer.shouldRasterize = true
        
        //Set up tableview
        self.tableView.reloadData()
        self.tableView.tableFooterView = UIView()
        
        if self.revealViewController() != nil {
            menuButton.target = self
            menuButton.action = "pressedMenuButton"
        }
        statusLabel.layer.shouldRasterize = false
        statusLabel.attributedText = secondWordBolded("Current Status", size: 17.0)
        
        
        
        
        rainlineLabel.attributedText = secondWordBolded("Rain LINE", size: 17.0)
        rainlineView.layer.shouldRasterize = false
        rainlineView.layer.shadowColor = UIColor.blackColor().CGColor
        rainlineView.layer.shadowOpacity = 1
        rainlineView.layer.shadowOffset = CGSizeZero
        rainlineView.layer.shadowRadius = 3
        //Change color of the banners
        //statusView.backgroundColor = COLOR_ACCENT
        //twitterBanner.backgroundColor = COLOR_ACCENT
        
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.sizeToFit()
        self.tableView.tableFooterView = UIView()

        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tableView.sizeToFit()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetail" {
            let destinationViewController = segue.destinationViewController as! HomeDetailViewController
            destinationViewController.titleString = LOCATION_STRING_ARRAY[selectedIndexPathRow!]
            destinationViewController.locationIndex = selectedIndexPathRow!
        }
     }
    

    
    
    //***************************************************
    // MARK: - Tableview Delegate
    //***************************************************
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LOCATION_STRING_ARRAY.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("homeCell", forIndexPath: indexPath) as! HomeTableViewCell
        cell.locationLabel.text = LOCATION_STRING_ARRAY[indexPath.row]
        if isOpen(indexPath.row, currentDay: NSDate().dayOfWeek()!) {
            cell.statusLabel.text = "Open"
            cell.statusLabel.textColor = UIColor(netHex: 0x006400)
        }
        else {
            cell.statusLabel.text = "Closed"
            cell.backgroundColor = UIColor(netHex: 0xEAEAEA)
            cell.statusLabel.textColor = COLOR_ACCENT
        }
        

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndexPathRow = indexPath.row
        performSegueWithIdentifier("toDetail", sender: self)
    }
    
    
    
    
    
    func pressedMenuButton() {
        
        self.revealViewController().revealToggle(self)
        let menuVC = self.revealViewController().rearViewController.childViewControllers[0] as! MenuTableViewController
        
    }

    @IBAction func didPressRainlineButton(sender: UIButton) {
        
    }

  
}

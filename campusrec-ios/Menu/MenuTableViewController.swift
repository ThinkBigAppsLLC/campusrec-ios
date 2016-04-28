//
//  MenuTableViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/6/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController, SWRevealViewControllerDelegate {
    
    let panRec = UIPanGestureRecognizer()
    
    
    var unfocusedView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = COLOR_SECONDARY_BACKGROUND
        
        //Set up custom bar button
        let button: UIButton = UIButton(type: .Custom)
        button.setImage(UIImage(named: "Logo"), forState: .Normal)
        //button.addTarget(self, action: "pressedButton", forControlEvents: UIControlEvents.TouchUpInside)
        button.frame = CGRectMake(0, 0, 31, 31)
        
        //Apply custom bar button
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        //menuButton = barButton
        
        if self.revealViewController() != nil {
            self.navigationItem.leftBarButtonItem!.target = self.revealViewController()
            self.navigationItem.leftBarButtonItem!.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            //self.revealViewController().frontViewShadowRadius = 0
            //self.revealViewController().frontViewShadowOffset = CGSizeMake(5, 0)
        }
        
        
        
    


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MENU_STRING_ARRAY.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath) as! MenuTableViewCell

        cell.menuLabel.text = MENU_STRING_ARRAY[indexPath.row][0]
        cell.menuButton.setImage(UIImage (named: MENU_STRING_ARRAY[indexPath.row][1]), forState: .Normal)
        

        return cell
    }
    


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            performSegueWithIdentifier("toHome", sender: nil)
            break
        case 1:
            performSegueWithIdentifier("toCalendar", sender: nil)
            break
        case 2:
            performSegueWithIdentifier("toIM", sender: nil)
            break
        case 3:
            performSegueWithIdentifier("toReservations", sender: nil)
            break
        case 4:
            performSegueWithIdentifier("toContact", sender: nil)
            break
        default:
            break
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        switch segue.identifier! {
        case "toHome":
            let upcomingVC = segue.destinationViewController.childViewControllers[0] as! HomeCollectionViewController
            break
        case "toCalendar":
            let upcomingVC = segue.destinationViewController.childViewControllers[0] as! CalendarViewController

            break
        case "toIM":
            let upcomingVC = segue.destinationViewController.childViewControllers[0] as! IMViewController

            break
        case "toReservations":
            let upcomingVC = segue.destinationViewController.childViewControllers[0] as! ReservationsViewController

            break
        case "toContact":
            let upcomingVC = segue.destinationViewController.childViewControllers[0] as! ContactCollectionViewController
           
            break
        default:
            break
            
        }
        //let upcomingViewController = segue.destinationViewController
        //if upcomingViewController.unfocusedView != nil {
            
        
    }
    
    
    //***************************************************
    // MARK: - Custom Methods
    //***************************************************
    func revealControllerPanGestureEnded(revealController: SWRevealViewController!) {
        if unfocusedView != nil {
            unfocusedView.hidden = true
        }
    }
}


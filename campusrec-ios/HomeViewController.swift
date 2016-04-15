//
//  HomeViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/6/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit
import ImageSlideshow
import TwitterKit


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //***************************************************
    // MARK: - Variables and Outlets
    //***************************************************

    
    @IBOutlet var menuButton: UIBarButtonItem!
    
    @IBOutlet var slideshow: ImageSlideshow!
    
    @IBOutlet var statusView: UIView!
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var twitterBanner: UIView!
    
    //@IBOutlet var tweetView: TWTRTweetView!
    
    var unfocusedView: UIView!
    
    var selectedIndexPathRow : Int?
    //***************************************************
    // MARK: - View Management
    //***************************************************

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create the unfocused view, which is a semi-opaque film that focuses the menu
        unfocusedView = UIView()
        unfocusedView.frame = self.view.frame
        unfocusedView.backgroundColor = COLOR_PRIMARY_TEXT
        unfocusedView.alpha = 0.5
        self.view.addSubview(unfocusedView)
        unfocusedView.hidden = true
        
        
        
        //Set up tableview
        self.tableView.reloadData()
        self.tableView.tableFooterView = UIView()
        
        if self.revealViewController() != nil {
            menuButton.target = self
            menuButton.action = "pressedMenuButton"
            //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        

        
        //Set up slideshow
        slideshow.backgroundColor = UIColor.clearColor()
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = PageControlPosition.Hidden
         slideshow.setImageInputs([
                AlamofireSource(urlString: "http://campusrec.fsu.edu/sites/default/files/4.7_drop-it-hot_web_ER.jpg")!,
                AlamofireSource(urlString: "http://campusrec.fsu.edu/sites/default/files/4.16_RezYoga_AJ_0.jpg")!,
                AlamofireSource(urlString: "http://campusrec.fsu.edu/sites/default/files/4.1_April_OP_web_DR.jpg")!,
                AlamofireSource(urlString: "http://campusrec.fsu.edu/sites/default/files/4.13_Sunset_Rez_web_DR.jpg")!
            ])
        
        
        //Set up twitter
        /*let client = TWTRAPIClient()
        client.loadTweetWithID("20") { tweet, error in
            if let t = tweet {
                self.tweetView.configureWithTweet(t)
            } else {
                print("Failed to load Tweet: \(error!.localizedDescription)")
            }
        }*/

        
        //Change color of the banners
        statusView.backgroundColor = COLOR_ACCENT
        //twitterBanner.backgroundColor = COLOR_ACCENT
        
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.sizeToFit()
        

        
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
            let destinationViewController = segue.destinationViewController as! StatusDetailCollectionViewController
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
        cell.statusLabel.text = "Open"
        
        if cell.statusLabel.text == "Open" {
            cell.statusLabel.textColor = UIColor(netHex: 0x006400)
        }
        else {
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
        menuVC.unfocusedView = self.unfocusedView
        
        unfocusedView.hidden = false
    }


  
}

//
//  HomeViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/6/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit
import ImageSlideshow

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //***************************************************
    // MARK: - Variables and Outlets
    //***************************************************

    @IBOutlet var tableView: UITableView!

    @IBOutlet var slideshow: ImageSlideshow!
    @IBOutlet var menuButton: UIBarButtonItem!
    
    @IBOutlet var underView: UIView!
    
    
    
    var unfocusedView: UIView!
    //***************************************************
    // MARK: - View Management
    //***************************************************

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        unfocusedView = UIView()
        unfocusedView.frame = self.view.frame
        unfocusedView.backgroundColor = COLOR_PRIMARY_TEXT
        unfocusedView.alpha = 0.5
        self.view.addSubview(unfocusedView)
        unfocusedView.hidden = true
        
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        if self.revealViewController() != nil {
            menuButton.target = self
            menuButton.action = "pressedMenuButton"
            /*menuButton.target = self.revealViewController()
             menuButton.action = "revealToggle:"*/
            //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        //Set up menu
        /*if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            //view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }*/
        
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

        underView.backgroundColor = COLOR_ACCENT
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func pressedMenuButton() {
        
        self.revealViewController().revealToggle(self)
        let menuVC = self.revealViewController().rearViewController.childViewControllers[0] as! MenuTableViewController
        menuVC.unfocusedView = self.unfocusedView
        
        unfocusedView.hidden = false
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

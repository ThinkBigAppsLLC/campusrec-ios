//
//  ReservationsViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/7/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit

class ReservationsViewController: UIViewController {

    @IBOutlet var menuButton: UIBarButtonItem!
    
    let url = "http://fsucr.setmore.com/"

    override func viewDidLoad() {
        super.viewDidLoad()
        


        
        if self.revealViewController() != nil {
            menuButton.target = self
            menuButton.action = "pressedMenuButton"
            //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        if let requestUrl = NSURL(string: url) {
            UIApplication.sharedApplication().openURL(requestUrl)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func pressedMenuButton() {
        
        self.revealViewController().revealToggle(self)
    }

}

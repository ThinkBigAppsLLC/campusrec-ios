//
//  StatusViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/7/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {

    @IBOutlet var menuButton: UIBarButtonItem!
    var unfocusedView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        unfocusedView = UIView()
        unfocusedView.frame = self.view.frame
        unfocusedView.backgroundColor = COLOR_PRIMARY_TEXT
        unfocusedView.alpha = 0.5
        self.view.addSubview(unfocusedView)
        unfocusedView.hidden = true

        
        if self.revealViewController() != nil {
            menuButton.target = self
            menuButton.action = "pressedMenuButton"
            /*menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"*/
            //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
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
        unfocusedView.hidden = false
    }

}

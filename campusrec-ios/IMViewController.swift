//
//  IMViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/7/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit

class IMViewController: UIViewController {
    
    @IBOutlet var menuButton: UIBarButtonItem!

    @IBOutlet var webView: UIWebView!
    
    let url = "http://fsucr.setmore.com/"
    
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
            //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        

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

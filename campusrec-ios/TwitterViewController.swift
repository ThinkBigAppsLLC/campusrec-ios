//
//  TwitterViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/10/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterViewController: TWTRTimelineViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Fabric implementation to embed a twitter feed
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName:  "FSUCampusRec", APIClient: client)
        
        self.showTweetActions = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tableView.sizeToFit()
        
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

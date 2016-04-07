//
//  MenuNavigationViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/6/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit

class MenuNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let stripeView: UIView = UIView()
        stripeView.frame = CGRectMake(0, 0, self.view.frame.width, 20)
        stripeView.backgroundColor = COLOR_ACCENT_DARK
        self.view.addSubview(stripeView)
        
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

}

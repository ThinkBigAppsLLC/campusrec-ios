//
//  HomeViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/6/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit
import ImageSlideshow

class HomeViewController: UIViewController {
    
    //***************************************************
    // MARK: - Variables and Outlets
    //***************************************************


    @IBOutlet var slideshow: ImageSlideshow!
    @IBOutlet var menuButton: UIBarButtonItem!
    
    @IBOutlet var underView: UIView!
    //***************************************************
    // MARK: - View Management
    //***************************************************

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set up menu
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

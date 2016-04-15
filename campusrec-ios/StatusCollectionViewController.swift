//
//  StatusCollectionViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/11/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit
import CSStickyHeaderFlowLayout
private let reuseIdentifier = "statusCell"

class StatusCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    @IBOutlet var menuButton: UIBarButtonItem!
    var unfocusedView: UIView!
    
    
    var selectedIndexPath : NSIndexPath?
    
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

        
        // Uncomment the following line to preserve selection between presentations
        //self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
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
            destinationViewController.navigationController?.title = "lol"
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //return STATUS_HEADER_ARRAY.count
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return LOCATION_STRING_ARRAY.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! StatusCollectionViewCell
        cell.statusLabel.text = "Open"
        cell.locationLabel.text = LOCATION_STRING_ARRAY[indexPath.row]
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.whiteColor()
        }
        else {
            cell.backgroundColor = COLOR_ODD_ROWS
        }
        
        //Add a border
        /*
        var view = UIView(frame: cell.frame)
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.blackColor().CGColor
        */
    
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.collectionView!.frame.width, height: 80)
    }
    
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets()
    }

    
    func pressedMenuButton() {
        
        self.revealViewController().revealToggle(self)
        unfocusedView.hidden = false
    }
}

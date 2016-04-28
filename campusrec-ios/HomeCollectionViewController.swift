//
//  HomeCollectionViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/27/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit
import TwitterKit


class HomeCollectionViewController: UICollectionViewController,
    UICollectionViewDelegateFlowLayout
    {
    
    //***************************************************
    // MARK: - Variables and Outlets
    //***************************************************
    
    //MARK: Outlets
    @IBOutlet var menuButton: UIBarButtonItem!
    
    @IBOutlet var layout: UICollectionViewFlowLayout!
    
    //MARK: Variables
    var selectedIndexPathRow : Int?
    
    var tweets : [AnyObject] = []
    
    //***************************************************
    // MARK: - View Setup
    //***************************************************

    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = true
        
        self.navigationController?.title = "Campus Rec"
        
        self.collectionView!.clipsToBounds = false
        self.collectionView!.layer.masksToBounds = false

        if self.revealViewController() != nil {
            menuButton.target = self
            menuButton.action = "pressedMenuButton"
        }
        
        layout.sectionHeadersPinToVisibleBounds = true
        
        
        let client = TWTRAPIClient()
        
        let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
        let params = ["screen_name": "fsuimrainline", "count" : "1", "exclude_replies" : "true"]
        var clientError : NSError?
        
        let request = client.URLRequestWithMethod("GET", URL: statusesShowEndpoint, parameters: params, error: &clientError)
        
        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            if connectionError != nil {
                print("Error: \(connectionError)")
            }
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: [])
                //print(json)
                //let tweets = TWTRTweet.tweetsWithJSONArray(json as! [AnyObject])
                print("json: \(json)")
                self.tweets = TWTRTweet.tweetsWithJSONArray(json as! [NSDictionary])
                self.refresh()

            } catch let jsonError as NSError {
                print("json error: \(jsonError.localizedDescription)")
            }
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //***************************************************
    // MARK: - Navigation
    //***************************************************


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetail" {
            let destinationViewController = segue.destinationViewController as! HomeDetailViewController
            destinationViewController.titleString = LOCATION_STRING_ARRAY[selectedIndexPathRow!]
            destinationViewController.locationIndex = selectedIndexPathRow!
        }
    }
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return LOCATION_STRING_ARRAY.count
        }
        else {
            return 1
        }
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("locationCell", forIndexPath: indexPath) as! LocationCollectionViewCell
            cell.locationLabel.text = LOCATION_STRING_ARRAY[indexPath.row]
            if isOpen(indexPath.row, currentDay: NSDate().dayOfWeek()!) {
                cell.statusLabel.text = "Open"
                cell.statusLabel.textColor = UIColor(netHex: 0x006400)
                cell.backgroundColor = UIColor.whiteColor()
                cell.nextAccessory.alpha = 1.0
                cell.statusLabel.alpha = 1.0
                cell.locationLabel.textColor = UIColor.blackColor()
            }
            else {
                cell.statusLabel.text = "Closed"
                cell.backgroundColor = UIColor(netHex: 0xEAEAEA)
                cell.statusLabel.textColor = COLOR_ACCENT
                cell.nextAccessory.alpha = 0.65
                cell.statusLabel.alpha = 0.65
                cell.locationLabel.textColor = UIColor.darkGrayColor()
            }
            let border = CALayer()
            let width = CGFloat(0.5)
            border.borderColor = UIColor.lightGrayColor().CGColor
            border.frame = CGRect(x: 0,
                                  y: cell.frame.size.height - width,
                                  width:  cell.frame.size.width,
                                  height: cell.frame.size.height)
            
            border.borderWidth = width
            cell.layer.addSublayer(border)
            cell.layer.masksToBounds = true
            return cell
            
        }
        else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("twitterCell", forIndexPath: indexPath) as! TwitterCollectionViewCell
            if (tweets.count != 0) {
                cell.tweetView.configureWithTweet(tweets[0] as! TWTRTweet)
            }
            
            
            

            
            return cell
        }
        
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section != 1 {
            selectedIndexPathRow = indexPath.row
            performSegueWithIdentifier("toDetail", sender: self)
        }
    }
    
    
    //***************************************************
    // MARK: - UICollectionviewLayout Delegate Functions
    //***************************************************
    
    //Takes out the spacing between cells
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets()
    }
    
    
    //Returns heights based on the section index
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: self.collectionView!.frame.width, height: 50)
        }
        
        else {
            return CGSize(width: self.collectionView!.frame.width, height: 200)
        }
        
    }
    
    //***************************************************
    // MARK: - Header Delegate Functions
    //***************************************************

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind,withReuseIdentifier: "headerView",forIndexPath: indexPath) as! HomeHeaderCollectionReusableView
            
            if indexPath.section == 0 {
                headerView.setUpHeaderLabel("Current Status", size: 15.0)
                headerView.phoneButton.hidden = true
                headerView.phoneNumberLabel.hidden = true
            }
            else {
                headerView.setUpHeaderLabel("Rain LINE", size: 15.0)
                headerView.phoneButton.hidden = false
                headerView.phoneNumberLabel.hidden = false
            }
            
            headerView.layer.shadowColor = UIColor.blackColor().CGColor
            headerView.layer.shadowOffset = CGSizeZero //CGSizeMake(0, 1)
            headerView.layer.shadowOpacity = 3
            headerView.layer.shadowRadius = 2.0
            headerView.clipsToBounds = false
            headerView.layer.masksToBounds = false
            
            headerView.backgroundColor = COLOR_SECONDARY_BACKGROUND
            
            
            //Add border
            /*let border = CALayer()
            let width = CGFloat(1.0)
            border.borderColor = UIColor.darkGrayColor().CGColor
            border.frame = CGRect(x: 0, y: headerView.categoryLabel.frame.size.height - width, width:  headerView.frame.width,
                height: headerView.categoryLabel.frame.size.height)
            
            border.borderWidth = width
            headerView.categoryLabel.layer.addSublayer(border)
            headerView.categoryLabel.layer.masksToBounds = true*/
            
            return headerView
            

        default:
            assert(false, "Unexpected element kind")
            
        }
        return UICollectionReusableView()
    }
    
    
    
    //***************************************************
    // MARK: - <#Category Name#>
    //***************************************************

    
    
    
    //***************************************************
    // MARK: - Custom Functions
    //***************************************************
    func pressedMenuButton() {
        self.revealViewController().revealToggle(self)
    }
    
    
    func refresh() {
        self.collectionView?.reloadData()
    }


}

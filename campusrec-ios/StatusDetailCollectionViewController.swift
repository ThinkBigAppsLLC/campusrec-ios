//
//  StatusDetailCollectionViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/11/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit

class StatusDetailCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    //***************************************************
    // MARK: - Outlets and Variables
    //***************************************************

    var titleString : String!
    var locationIndex : Int!
    
    @IBOutlet var layout: UICollectionViewFlowLayout!
    //***************************************************
    // MARK: - View Setup
    //***************************************************

    
       override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.title = titleString
        layout.sectionHeadersPinToVisibleBounds = true
        //self.collectionView?.collectionViewLayout.section
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return STATUS_HEADER_ARRAY.count+1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("headerCell", forIndexPath: indexPath) as! StatusDetailHeaderCollectionViewCell
            //cell.backgroundColor = UIColor.whiteColor()
            cell.headerImage.image = UIImage(named: LOCATION_IMAGE_ARRAY[locationIndex])
            cell.detailStatusLocationLabel.text = titleString
            cell.detailStatusLabel.text = "Open"
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("statusDetailCell", forIndexPath: indexPath) as! StatusDetailCollectionViewCell
            if indexPath.section == 1 {
                cell.textView.text = OPERATING_HOURS_TEXT[locationIndex]
                
                
                //cell.bounds = CGRect(x: cell.frame.minX, y:cell.frame.minY, width: self.view.frame.width, height: cell.textView.frame.height + 16)
            }
            if indexPath.section == 2 {
                cell.textView.text = DETAILED_INFO_TEXT[locationIndex]
                
                
                //cell.bounds = CGRect(x: cell.frame.minX, y:cell.frame.minY, width: self.view.frame.width, height: cell.textView.frame.height + 16)
            }
            if indexPath.section == 3 {
                cell.textView.text = "Placeholder"
                
                
                //cell.bounds = CGRect(x: cell.frame.minX, y:cell.frame.minY, width: self.view.frame.width, height: cell.textView.frame.height + 16)
            }
            
            cell.backgroundColor = UIColor.whiteColor()
            return cell
        }
    }
    
    ///Sets up header
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionElementKindSectionHeader:
                let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind,withReuseIdentifier: "headerView",forIndexPath: indexPath) as! StatusDetailCollectionReusableView
                headerView.setupCategoryLabel(STATUS_HEADER_ARRAY[indexPath.section-1])
                
                //Add border
                let border = CALayer()
                let width = CGFloat(1.0)
                border.borderColor = UIColor.darkGrayColor().CGColor
                border.frame = CGRect(x: 0, y: headerView.categoryLabel.frame.size.height - width, width:  headerView.categoryLabel.frame.size.width, height: headerView.categoryLabel.frame.size.height)
                
                border.borderWidth = width
                headerView.categoryLabel.layer.addSublayer(border)
                headerView.categoryLabel.layer.masksToBounds = true
                
                return headerView
            default:
                assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSizeZero
        }
        else {
            return CGSize(width: self.view.frame.width, height: 50)
        }
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: self.collectionView!.frame.width, height: 200)
        }
        if indexPath.section == 1 {
            return CGSize(width: self.collectionView!.frame.width, height: 100)
        }
            
        else {
            //let cell = self.collectionView?.cellForItemAtIndexPath(indexPath) as! StatusDetailCollectionViewCell
            
            return CGSize(width: self.collectionView!.frame.width, height: 300)
        }
        
    }
    
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets()
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)

    }
}

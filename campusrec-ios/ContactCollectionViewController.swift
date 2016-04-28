//
//  ContactCollectionViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/14/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit

private let reuseIdentifier = "personCell"

class ContactCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    @IBOutlet var menuButton: UIBarButtonItem!
    @IBOutlet var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        
        if self.revealViewController() != nil {
            menuButton.target = self
            menuButton.action = "pressedMenuButton"
        }
        layout.sectionHeadersPinToVisibleBounds = true
        
        // Register cell classes
        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return CONTACT_LOCATION_INFO.count
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch section {
        case 0:
            return CONTACT_ADMIN_ARRAY.count
        case 1:
            return CONTACT_LEACH_ARRAY.count
        case 2:
            return CONTACT_WELLNESS_ARRAY.count
        case 3:
            return CONTACT_IM_ARRAY.count
        case 4:
            return CONTACT_CLUBS_ARRAY.count
        case 5:
            return CONTACT_RES_ARRAY.count
        default:
            return 0
        }
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ContactCollectionViewCell
        switch indexPath.section {
        case 0:
            cell.personLabel.text = CONTACT_ADMIN_ARRAY[indexPath.row][0]
            cell.jobLabel.text = CONTACT_ADMIN_ARRAY[indexPath.row][1]
            cell.phoneNumber = CONTACT_ADMIN_ARRAY[indexPath.row][2]
            break
        case 1:
            cell.personLabel.text = CONTACT_LEACH_ARRAY[indexPath.row][0]
            cell.jobLabel.text = CONTACT_LEACH_ARRAY[indexPath.row][1]
            cell.phoneNumber = CONTACT_LEACH_ARRAY[indexPath.row][2]
            break
        case 2:
            cell.personLabel.text = CONTACT_WELLNESS_ARRAY[indexPath.row][0]
            cell.jobLabel.text = CONTACT_WELLNESS_ARRAY[indexPath.row][1]
            cell.phoneNumber = CONTACT_WELLNESS_ARRAY[indexPath.row][2]
            break
        case 3:
            cell.personLabel.text = CONTACT_IM_ARRAY[indexPath.row][0]
            cell.jobLabel.text = CONTACT_IM_ARRAY[indexPath.row][1]
            cell.phoneNumber = CONTACT_IM_ARRAY[indexPath.row][2]
            break
        case 4:
            cell.personLabel.text = CONTACT_CLUBS_ARRAY[indexPath.row][0]
            cell.jobLabel.text = CONTACT_CLUBS_ARRAY[indexPath.row][1]
            cell.phoneNumber = CONTACT_CLUBS_ARRAY[indexPath.row][2]
            break
        case 5:
            cell.personLabel.text = CONTACT_RES_ARRAY[indexPath.row][0]
            cell.jobLabel.text = CONTACT_RES_ARRAY[indexPath.row][1]
            cell.phoneNumber = CONTACT_RES_ARRAY[indexPath.row][2]
            break
        default:
            cell.personLabel.text = ""
            cell.jobLabel.text = ""
            break
        }
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.whiteColor()
        }
        else {
            cell.backgroundColor = COLOR_ODD_ROWS
        }

        
        
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind,withReuseIdentifier: "headerView",forIndexPath: indexPath) as! ContactCollectionReusableView
            headerView.categoryLabel.text = CONTACT_LOCATION_INFO[indexPath.section]
            
            
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
        return UICollectionReusableView()
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)
    
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
        return CGSize(width: self.collectionView!.frame.width, height: 50)
    }
    
    
    
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets()
    }
    


    
    func pressedMenuButton() {
        
        self.revealViewController().revealToggle(self)
        let menuVC = self.revealViewController().rearViewController.childViewControllers[0] as! MenuTableViewController
        //menuVC.unfocusedView = self.unfocusedView
        
    }

}

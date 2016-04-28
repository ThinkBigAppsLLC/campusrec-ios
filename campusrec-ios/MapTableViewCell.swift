//
//  MapTableViewCell.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/20/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell {

    @IBOutlet var mapView: MKMapView!
    
    
    var parentViewController : HomeDetailViewController!

    
    let regionRadius: CLLocationDistance = 750
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setupMap(address : String) {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
            if((error) != nil){
                print("Error", error)
            }
            if let placemark = placemarks?.first {
                let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                
                let dropPin = MKPointAnnotation()
                dropPin.coordinate = coordinates
                self.mapView.addAnnotation(dropPin)
                
                self.parentViewController.latitude = coordinates.latitude
                self.parentViewController.longitude = coordinates.longitude
                let coordinateRegion = MKCoordinateRegionMakeWithDistance(placemark.location!.coordinate, self.regionRadius * 2.0, self.regionRadius * 2.0)
                self.mapView.setRegion(coordinateRegion, animated: true)
            }
        })
    }
    
   
}

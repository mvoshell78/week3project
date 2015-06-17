//
//  DetailViewController.swift
//  Week3Project
//
//  Created by Michael Voshell on 6/13/15.
//  Copyright (c) 2015 Michael Voshell. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
  var currentBus : myLocationClass? = nil;
    
    
    
    
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet var titleLabel: UILabel!
   
    @IBAction func changeMapType(sender: AnyObject) {
        // adds a toggle between standard and hybrid map view
        if myMap.mapType == MKMapType.Standard {
            myMap.mapType = MKMapType.Hybrid
        } else {
            myMap.mapType = MKMapType.Standard
        }
        
       
    }
    
    
    let locationManager : CLLocationManager = CLLocationManager();
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // assigns lat and lon to a var
        let position : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:currentBus!.myLat , longitude: currentBus!.myLon);
        
       // height and width plus postion on map
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01);
        let region = MKCoordinateRegionMake(position, span);
        
        // adds location to the map
        myMap.region = region;
        
        // requests access to the GPS
        locationManager.requestWhenInUseAuthorization();

        
    }

    override func viewWillAppear(animated: Bool) {
        let position : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:currentBus!.myLat, longitude:currentBus!.myLon);
        
        // adds a pin and pin data to the location
        let pinAnnotation : MKPointAnnotation = MKPointAnnotation();
       pinAnnotation.title = currentBus!.myTitle;
       pinAnnotation.subtitle = currentBus!.mySub;
        
        pinAnnotation.coordinate = position;
        myMap.addAnnotation(pinAnnotation);
        // added a label to the screen
        titleLabel.text = currentBus?.myTitle;
        
        // rounded corners of the label
        titleLabel.layer.masksToBounds = true;
        titleLabel.layer.cornerRadius = 5.0;
        
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

//
//  MapViewController.swift
//  Week3Project
//
//  Created by Michael Voshell on 6/13/15.
//  Copyright (c) 2015 Michael Voshell. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
 // required to pass full array from view controller
    var allBus : [myLocationClass]? = nil;
    
    // required for map kit
    let locationManager : CLLocationManager = CLLocationManager();
    
    // conncets mapkit with view controller
    @IBOutlet var myMap: MKMapView!
    
    @IBAction func changeMapType(sender: AnyObject) {
       // adds a toggle between standard and hybrid map view
            if myMap.mapType == MKMapType.Standard {
                myMap.mapType = MKMapType.Hybrid
            } else {
                myMap.mapType = MKMapType.Standard
            }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // determines center of map I choose 0, there would always be a 0 could be any index of the array
        let position : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:allBus![0].myLat , longitude: allBus![0].myLon);
        
        // Do any additional setup after loading the view.
        // height and width of the map
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03);
        // center plus height and width
        let region = MKCoordinateRegionMake(position, span);
        // myMap outlet assigned to region from above
        myMap.region = region;
        
        // causes to ask for GPS access
        locationManager.requestWhenInUseAuthorization();
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // loop to put multiple pins on the map based on number of items in the array
        for var i = 0; i < allBus!.count; ++i {
         // assigns pin lon and a lat
        let position : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:allBus![i].myLat, longitude:allBus![i].myLon);
        
            
        let pinAnnotation : MKPointAnnotation = MKPointAnnotation();
        
            // title and sub title
        pinAnnotation.title = allBus![i].myTitle;
        pinAnnotation.subtitle = allBus![i].mySub;
        
            // gives pin a position
        pinAnnotation.coordinate = position;
        
            //adds annothation to the map
            myMap.addAnnotation(pinAnnotation);
        }
       
       
        
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

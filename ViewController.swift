//
//  ViewController.swift
//  Week3Project
//
//  Created by Michael Voshell on 6/13/15.
//  Copyright (c) 2015 Michael Voshell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    // outlet for my tableView
    @IBOutlet var myTableView: UITableView!
   
    // declareing  my custom class array
    var locArray : [myLocationClass] = [];
   
    // unwind segue for back button
    @IBAction func backButton ( segue : UIStoryboardSegue)
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // instances of my custom class for locArray
        
        var pinLoc : myLocationClass = myLocationClass();
        pinLoc.myLat = 39.159899;
        pinLoc.myLon = -75.553180;
        pinLoc.myTitle = " Redner's Market";
        pinLoc.mySub = "25 Greentree Dr";
        
        var pinLoc2 : myLocationClass = myLocationClass();
        pinLoc2.myLat = 39.158719;
        pinLoc2.myLon = -75.551343;
        pinLoc2.myTitle = " Pats Pizza";
        pinLoc2.mySub = "1244 Forest Ave";
        
        var pinLoc3 : myLocationClass = myLocationClass();
        pinLoc3.myLat = 39.159458;
        pinLoc3.myLon = -75.542780;
        pinLoc3.myTitle = " Subway";
        pinLoc3.mySub = "21 Saulsbury Rd";
        
        var pinLoc4 : myLocationClass = myLocationClass();
        pinLoc4.myLat = 39.159125;
        pinLoc4.myLon = -75.543499;
        pinLoc4.myTitle = " Walgreens";
        pinLoc4.mySub = "1007 Forest Ave";
        
        var pinLoc5 : myLocationClass = myLocationClass();
        pinLoc5.myLat = 39.158456;
        pinLoc5.myLon = -75.543166;
        pinLoc5.myTitle = " KFC";
        pinLoc5.mySub = "1030 Forest Ave";
        
        var pinLoc6 : myLocationClass = myLocationClass();
        pinLoc6.myLat = 39.158433;
        pinLoc6.myLon = -75.543228;
        pinLoc6.myTitle = " Dollar Tree";
        pinLoc6.mySub = "1030 Forest Ave";
        
        var pinLoc7 : myLocationClass = myLocationClass();
        pinLoc7.myLat = 39.158433;
        pinLoc7.myLon = -75.543228;
        pinLoc7.myTitle = " Food Lion";
        pinLoc7.mySub = "1030 Forest Ave";
        
        var pinLoc8 : myLocationClass = myLocationClass();
        pinLoc8.myLat = 39.154359;
        pinLoc8.myLon = -75.541381;
        pinLoc8.myTitle = " Royal Farms";
        pinLoc8.mySub = "293 S Saulsbury Rd";
        
        var pinLoc9 : myLocationClass = myLocationClass();
        pinLoc9.myLat = 39.164924;
        pinLoc9.myLon = -75.544643;
        pinLoc9.myTitle = " Dover Federal Credit Union";
        pinLoc9.mySub = "225 S Saulsbury Rd";
        
        var pinLoc10 : myLocationClass = myLocationClass();
        pinLoc10.myLat = 39.170139;
        pinLoc10.myLon = -75.547428;
        pinLoc10.myTitle = " 7-11";
        pinLoc10.mySub = "1019 Walker Rd";
        
        // appending instances of custom class to the array
        locArray.append(pinLoc);
        locArray.append(pinLoc2);
        locArray.append(pinLoc3);
        locArray.append(pinLoc4);
        locArray.append(pinLoc5);
        locArray.append(pinLoc6);
        locArray.append(pinLoc7);
        locArray.append(pinLoc8);
        locArray.append(pinLoc9);
        locArray.append(pinLoc10);
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {// adds cells to the table view based on number of elements in the array
        return locArray.count;
       
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {// allows to select info based on which cell is selected
        let currentBus : myLocationClass = locArray[indexPath.row];
        var cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! CustomCell;
        cell.cellLabel!.text = currentBus.myTitle;
       
        return cell;
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toDetailViewController"
        {// passing data to the detailView controller
            
            var detailView : DetailViewController = segue.destinationViewController as! DetailViewController;
            // index path determines what was clicked in table
            var indexPath : NSIndexPath? = myTableView.indexPathForSelectedRow();
            
            let currentBus : myLocationClass = locArray[indexPath!.row];
           
            detailView.currentBus = currentBus;
          
      
            
         
        }
        
        if segue.identifier == "toMapView"
        {// passes data to the all locations view
            var mapView : MapViewController = segue.destinationViewController as! MapViewController;
           // passing entire array
            // requires this syntax match recieving viewconroller
                let allBus : [myLocationClass] = locArray;
                 mapView.allBus = allBus;
            
           
            
         
           
        }
    }
}


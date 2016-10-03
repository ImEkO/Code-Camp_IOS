//
//  KViewController.swift
//  NK
//
//  Created by Loris THIERRY on 20/04/16.
//  Copyright © 2016 Celine PHE. All rights reserved.
//
//

import UIKit
import MapKit

class KViewController: UIViewController, MKMapViewDelegate {
    

    @IBOutlet var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let theSpan:MKCoordinateSpan = MKCoordinateSpanMake(0.05 , 0.05)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 48.851899, longitude: 2.356137)
        let locationn:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 48.856667, longitude: 2.364430)
        let location3:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 48.857697, longitude: 2.278470)
        let theRegion:MKCoordinateRegion = MKCoordinateRegionMake(location, theSpan)
        
        myMap.setRegion(theRegion, animated: true)
        
        var anotation = MKPointAnnotation()
        anotation.coordinate = location
        anotation.title = "Nina Kendosa"
        anotation.subtitle = "43 rue saint-louis-en-île 75004"
        myMap.addAnnotation(anotation)
        
        var anotationn = MKPointAnnotation()
        anotationn.coordinate = locationn
        anotationn.title = "Nina Kendosa"
        anotationn.subtitle = "31 rue de turenne 75003"
        myMap.addAnnotation(anotationn)
        
        var anotation3 = MKPointAnnotation()
        anotation3.coordinate = location3
        anotation3.title = "Nina Kendosa"
        anotation3.subtitle = "65 rue de passy 75016"
        myMap.addAnnotation(anotation3)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: "action:")
        longPress.minimumPressDuration = 1.0
        myMap.addGestureRecognizer(longPress)
        
        
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        var touchPoint = gestureRecognizer.locationInView(self.myMap)
        var newCoord:CLLocationCoordinate2D = myMap.convertPoint(touchPoint, toCoordinateFromView: self.myMap)
        
        var newAnotation = MKPointAnnotation()
        newAnotation.coordinate = newCoord
        newAnotation.title = "New Location"
        newAnotation.subtitle = "New Subtitle"
        myMap.addAnnotation(newAnotation)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
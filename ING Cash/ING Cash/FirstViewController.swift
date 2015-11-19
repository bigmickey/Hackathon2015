//
//  FirstViewController.swift
//  ING Cash
//
//  Created by Paul Keller on 14/11/2015.
//  Copyright © 2015 Planet K Games. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set initial location in Bucharest
        let initialLocation = CLLocation(latitude: 44.485115, longitude: 26.106991)
        centerMapOnLocation(initialLocation)
        
        mapView.delegate = self
        
        createMapPoints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createMapPoints(){
        
        let atm1 = AtmMapPoint(title: "Made Up Name",
            locationName: "DBS",
            discipline: "Red",
            coordinate: CLLocationCoordinate2D(latitude: 44.485115, longitude: 26.106991))
        
        
        mapView.addAnnotation(atm1)
        
        
        let atm2 = AtmMapPoint(title: "Made Up Name",
            locationName: "DBS",
            discipline: "Amber",
            coordinate: CLLocationCoordinate2D(latitude: 44.483308, longitude: 26.107667))
        
        mapView.addAnnotation(atm2)
        
        let atm3 = AtmMapPoint(title: "Made Up Name",
            locationName: "DBS",
            discipline: "Green",
            coordinate: CLLocationCoordinate2D(latitude: 44.484411, longitude: 26.109727))

        mapView.addAnnotation(atm3)
        
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        /*
        if (annotation.isKindOfClass(MKUserLocation)){
            return nil
        }
        var myPin = mapView.dequeueReusableAnnotationViewWithIdentifier("pin") as? MKPinAnnotationView
        if myPin != nil {
            return myPin
        }
        
        myPin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        myPin?.pinColor = .Green
        return myPin
        */
        
        
        
        if let annotation = annotation as? AtmMapPoint {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView { // 2
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                //view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
            }
            view.pinColor = annotation.changeColor()
            return view
        } else {
            return nil
        }
        
    }

}


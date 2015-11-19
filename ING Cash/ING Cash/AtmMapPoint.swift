//
//  AtmMapPoint.swift
//  ING Cash
//
//  Created by Paul Keller on 15/11/2015.
//  Copyright © 2015 Planet K Games. All rights reserved.
//

import Foundation

import MapKit

class AtmMapPoint: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    // pinColor for disciplines: Sculpture, Plaque, Mural, Monument, other
    func changeColor() -> MKPinAnnotationColor  {
        switch discipline {
        case "Red":
            return .Red
        case "Amber":
            return .Purple
        default:
            return .Green
        }
    }
}

//
//  Point.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/12/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class Point: NSObject {
    
    var rate : Int =  0 ;
    var location : CLLocationCoordinate2D;
    
     init(rating : Int ,  location : CLLocationCoordinate2D) {
        
        self.rate =  rating;
        self.location =  location;
        
    }
    
    
    
    
    
    

}

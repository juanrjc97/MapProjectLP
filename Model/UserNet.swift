//
//  User.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/12/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import Foundation
//import CoreLocation

class UserNet: Codable {
    
    var name : String
    var LastName : String
    var email : String
    var userName : String
    //var MyTrash : [CLLocationCoordinate2D]?
    var myTrash : [PointNet]
    
    
    
}

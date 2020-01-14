//
//  User.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/12/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import Foundation
//import CoreLocation

struct UserNet: Codable {
    
    var idUsuario : Int?
    var cedula : String?
    var nombre : String?
    var apellido : String?
    var usuario : String?
    var contrasena: String?
    var email : String?
    
    //var MyTrash : [CLLocationCoordinate2D]?
   // var myTrash : [PointNet]
    
    
    /*"idUsuario": 4,
    "cedula": "094567912",
    "nombre": "Alanis",
    "apellido": "Vargas",
    "usuario": "alaK",
    "contrasena": "12345Ala",
    "email": "alaK@espol.edu.ec"
     
     "idUsuario": 1,
            "cedula": "0956295703",
            "nombre": "Bryan",
            "apellido": "Tutiven",
            "usuario": "brcetuti",
            "contrasena": "12345",
            "email": "bryan.tutiven.2@gmail.com"*/
    
    
    
}

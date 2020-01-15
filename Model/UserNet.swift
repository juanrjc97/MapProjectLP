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
    var nombre : String
    var apellido : String
    var usuario : String
    var contrasena: String
    var email : String
    
    /*init(nombre : String, apellido : String , usuario : String, contrasena : String , email :String) {
        self.nombre = nombre
        self.apellido = apellido
        self.usuario = usuario
        self.contrasena = contrasena
        self.email = email
        
    }*/
    //var MyTrash : [CLLocationCoordinate2D]?
   // var myTrash : [PointNet]
    
    
    /* {
           "idUsuario": 1,
           "nombre": "Bryan",
           "apellido": "Tutiven",
           "usuario": "brcetuti",
           "contrasena": "12345",
           "email": "brcetuti@espol.edu.ec"
       },
     
     */
    
    
    
}

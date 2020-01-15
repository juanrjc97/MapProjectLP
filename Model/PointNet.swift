//
//  PointNet.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/12/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import Foundation

struct PointNet: Codable {
    
    var idPunto : Int?
    var latitud : String
    var longitud : String
    var icono : String
    var sumaCalificacion : Int
    var cantidadUsuarioCal : Int
    var idUsuario : Int
    var idSector : Int
    
    
    
    
   // var rate: Int
    //-2.1686363,-79.8873876
    
    
}

/*  {
      "idPunto": 4,
      "latitud": "0.00000000000000000029",
      "longitud": "0.00000000000000000047",
      "icono": "BP",
      "sumaCalificacion": 4,
      "cantidadUsuarioCal": 1,
      "idUsuario": 1,
      "idSector": 4
 hacer un put para actulizar la sumCalificacion y cantidadUsuarioCal
 
 
  }*/

//
//  User.swift
//  MapProject
//
//  Created by Juan Jimenez on 12/22/19.
//  Copyright © 2019 Juan Jimenez. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class User: NSObject {
    
    var name : String = ""
    var LastName : String = ""
    var email : String = ""
    var userName : String = ""
    
    var MyTrash : [CLLocationCoordinate2D] =  []
    var MyImages : [UIImage] = []
    
    //var MyTrash : [Int : CLLocationCoordinate2D] =  [:]
    
   
    func AddUserAnnotations(coordenadas : CLLocationCoordinate2D){
        MyTrash.append(coordenadas)
    }
    
    func AddUserImages(imagen : UIImage){
        MyImages.append(imagen)
    }
    
    
   /* func AddUserPoints(coordenadas : CLLocationCoordinate2D)  {
        
        let  KeyIterator = 1  // es el valor que se va a usar + 1 para ser la key de cada elemento que se agrega
        
        if MyTrash.isEmpty {

            MyTrash[KeyIterator] = coordenadas
            
        }else{
            let lastkey =  MyTrash.count
            var newlastKey = lastkey + 1
            MyTrash[newlastKey] = coordenadas
        }
    }
    */
    
    // dos arreglos uno de annotations y otro de fotos
    // para poner la imagen en el callout se toma la posicion en el arreglo de annotatcion y se busca esa misma en el arreglo de fotos
    // tal vez es siempre la ultima posicion dado que la accion se realiza en el lapso en el que se arrega al arreglo por lo cual siempre seria la ultima en ser agregada
    
    
    
    
    
   

}

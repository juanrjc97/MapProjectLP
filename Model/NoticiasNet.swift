//
//  Noticias.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/13/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import Foundation

struct NoticiasNet : Codable {
    
    var idNoticia : Int
    var titulo : String
    var descripcion : String
    var url : String
    var tipoNoticia : String
    var idSector : Int
    
}

/*{
    "idNoticia": 1,
    "titulo": "Puerto Limpio",
    "descripcion": "Apostamos por la educación de los más pequeños para en el futuro tener ciudadanos más comprometidos con el manejo responsable de sus desechos. En esta ocasión visitamos el colegio Ecomundo para dar una charla educativa sobre el tema.",
    "url": "https://twitter.com/i/status/1215716955245764609",
    "tipoNoticia": "Noticia",
    "idSector": 1
},*/


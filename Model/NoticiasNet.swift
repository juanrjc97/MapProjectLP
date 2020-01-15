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
    "idNoticia": 3,
           "titulo": "Puerto Limpio",
           "descripcion": "¡Este nuevo año #PonDeTuParte! Conoce el horario y frecuencia de tu sector y saca tus desechos a tiempo. Haz clic aquí: http://bit.ly/HorarioRecolecciónPL ¿Ya ingresaste? #ElQueLaHaceLaPaga",
           "url": "https://twitter.com/i/status/1214924721403416576",
           "tipoNoticia": "nt",
           "idSector": 3
},*/


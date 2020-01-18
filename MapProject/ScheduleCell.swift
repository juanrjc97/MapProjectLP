//
//  ScheduleCell.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/17/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import UIKit

class ScheduleCell: UITableViewCell {
    
    
    @IBOutlet weak var ScheduleImgae: UIImageView!
    
    @IBOutlet weak var content: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    
    func setSchedule(horario : HorariosNet) {
        if horario.idSector ==  1 {
            title.text = "North"
            ScheduleImgae.image = UIImage(named: "horario")
            content.text = String("\(horario.dia)           \(horario.hora)" )
        }
        if horario.idSector ==  2 {
            title.text = "South"
                   ScheduleImgae.image = UIImage(named: "horario")
                   content.text = String("\(horario.dia)           \(horario.hora)" )
               }
        if horario.idSector ==  3 {
             title.text = "SouthWest"
                   ScheduleImgae.image = UIImage(named: "horario")
                   content.text = String("\(horario.dia)           \(horario.hora)" )
               }
        if horario.idSector ==  4 {
            title.text = "Center"
                   ScheduleImgae.image = UIImage(named: "horario")
                   content.text = String("\(horario.dia)           \(horario.hora)" )
               }
        if horario.idSector ==  4 {
               title.text = "NorthWest"
               ScheduleImgae.image = UIImage(named: "horario")
               content.text = String("\(horario.dia)           \(horario.hora)" )
           }

         
     }
}

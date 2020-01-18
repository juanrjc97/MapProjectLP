//
//  customNoticeCell.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/17/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import UIKit

class customNoticeCell: UITableViewCell {

 
    @IBOutlet weak var TypeNoticeView: UIImageView!
    
    @IBOutlet weak var contentlbl: UILabel!
    
    @IBOutlet weak var tittle: UILabel!
    
    func setNews(news : NoticiasNet) {
        
        if news.tipoNoticia == "nt" {
            TypeNoticeView.image = UIImage(named: "periodico")
            tittle.text = news.titulo
            contentlbl.text = news.descripcion
        }else if  news.tipoNoticia == "tp" {
            
            TypeNoticeView.image = UIImage(named: "bombilla")
            tittle.text = news.titulo
            contentlbl.text = news.descripcion
            
        }
        
        
    }
    
    
    
}

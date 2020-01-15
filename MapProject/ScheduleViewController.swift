//
//  ScheduleViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/12/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import UIKit

struct CellData{
    
    var openned : Bool
    var tittle : String // top level cell
    var SeccionData : [String]
    var sector : Int
    
    
}




class ScheduleViewController: UITableViewController {

   
    var tableViewData = [CellData]()
    //var horarios : [HorariosNet]?
    
    var celdaNorte = CellData(openned: false, tittle: "North", SeccionData: [], sector: 1)
    var celdaCenter = CellData(openned: false, tittle: "Center", SeccionData: [], sector: 2)
    var celdaNW =     CellData(openned: false, tittle: "NorthWest", SeccionData: [], sector: 3)
    var celdaSW =     CellData(openned: false, tittle: "SouthWest", SeccionData: [], sector: 4)
    var celdaSouth =  CellData(openned: false, tittle: "South", SeccionData: [], sector: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        self.cargarHorarios()

        // Do any additional setup after loading the view.
    }
    
    
    func cargarHorarios() {
        
        NetworkManager.shared.getHorarios { (horarios, errorMessage) in
            guard  let horarios = horarios else{
                                      //let alert = UIAlertController(title: "algo salio mal " , message: errorMessage! , preferredStyle: .alert)
                                      //self.present(alert, animated: true, completion: nil)
                                      print( errorMessage!.rawValue)
                                      return
                                  }
            
            for horario in horarios {
                if horario.idSector == self.celdaNorte.sector {
                             let fecha = "Dia: \(horario.dia)                 Hora: \(horario.hora)"
                    self.celdaNorte.SeccionData.append(fecha)
                }else if horario.idSector == self.celdaCenter.sector {
                             let fecha = "Dia: \(horario.dia)                 Hora: \(horario.hora)"
                    self.celdaCenter.SeccionData.append(fecha)
                }else if horario.idSector == self.celdaNW.sector {
                             let fecha = "Dia: \(horario.dia)                 Hora: \(horario.hora)"
                    self.celdaNW.SeccionData.append(fecha)
                         }
                else if horario.idSector == self.celdaSW.sector {
                             let fecha = "Dia: \(horario.dia)                 Hora: \(horario.hora)"
                    self.celdaSW.SeccionData.append(fecha)
                         }
                else if horario.idSector == self.celdaSouth.sector {
                             let fecha = "Dia: \(horario.dia)                 Hora: \(horario.hora)"
                    self.celdaSouth.SeccionData.append(fecha)
                         }
                         
                         
                     }
            self.tableViewData = [self.celdaNorte,self.celdaCenter,self.celdaNW,self.celdaSW,self.celdaSouth]
                               //print(horarios)
            //print(self.horarios)
            
        }
        
        
        
    }
    
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int{
              
        return tableViewData.count
          }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].openned == true{
            return tableViewData[section].SeccionData.count + 1
        }else{
            return 1
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        
        if indexPath.row == 0{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "North")else{return UITableViewCell()}
            
            cell.textLabel?.text = tableViewData[indexPath.section].tittle
            cell.textLabel?.textColor = .white
            //cell.backgroundColor = .red
            
            return cell
            
            
        }else{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Center")else{return UITableViewCell()}
            
            cell.textLabel?.text = tableViewData[indexPath.section].SeccionData[dataIndex]
            
            return cell
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].openned == true {
            tableViewData[indexPath.section].openned = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }else{
            tableViewData[indexPath.section].openned = true
            let sections = IndexSet.init(integer: indexPath.section)
            
            tableView.reloadSections(sections, with: .none)
            
            
        }
    }
    
   
    
    
    @IBAction func didTapExitBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
   
}

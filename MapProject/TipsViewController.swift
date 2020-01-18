//
//  TipsViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 12/23/19.
//  Copyright © 2019 Juan Jimenez. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController {

    
      var schedules : [HorariosNet] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    

    @IBAction func DimmisButton(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
   
}

extension TipsViewController: UITableViewDataSource, UITableViewDelegate {


func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     print(schedules.count)
       return  schedules.count
   }
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let horario  = schedules[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell") as! ScheduleCell
    cell.setSchedule(horario: horario)
    return cell
}

}

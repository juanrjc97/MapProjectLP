//
//  MenuViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 12/22/19.
//  Copyright © 2019 Juan Jimenez. All rights reserved.
//

import UIKit

enum MenuType: Int{
    case map
    case user
    case news
    case tips
    case horarios
    
}

class MenuViewController: UITableViewController {

    
    var didTapMenuType : ((MenuType)-> Void)? // captura el tipo de menu y lo vuelve opcional
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.largeTitleDisplayMode = .always

        // Do any additional setup after loading the view.
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menutype = MenuType.init(rawValue: indexPath.row) else {return}
        
        dismiss(animated: true){ [weak self] in
            //print("menu type : \(menutype)")
            self?.didTapMenuType?(menutype)
        }
    }
    
 
    
  /*  override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }*/
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

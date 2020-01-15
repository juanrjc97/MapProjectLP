//
//  NewsViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 12/23/19.
//  Copyright © 2019 Juan Jimenez. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func DismmisButton(_ sender: UIButton) {
        
            dismiss(animated: true, completion: nil)
        NetworkManager.shared.getNoticias { (noticias, errorMessage) in
                       guard  let noticias = noticias else{
                                                 //let alert = UIAlertController(title: "algo salio mal " , message: errorMessage! , preferredStyle: .alert)
                                                 //self.present(alert, animated: true, completion: nil)
                                                 print( errorMessage!.rawValue)
                                                 return
                                             }
                                             
                                          print(noticias)
                       
                   }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

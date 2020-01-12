//
//  UserViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 12/23/19.
//  Copyright © 2019 Juan Jimenez. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigUI()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func DismmisButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func ConfigUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    
    
    
    
    
    
    
    
   /* @IBAction func ExtiButton(_ sender: UIBarButtonItem) {
        
    }
    */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

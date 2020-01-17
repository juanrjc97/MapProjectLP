//
//  MainViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/16/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var SignUpBtn: UIButton!
    
    @IBOutlet weak var LoginBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         setUpElements()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func SignUpTapped(_ sender: UIButton) {
    }
    
    @IBAction func LoginTapped(_ sender: UIButton) {
    }
    
    
    
    func setUpElements()  {
        
        Utilities.styleFilledButton(SignUpBtn)
        Utilities.styleHollowButton(LoginBtn)
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

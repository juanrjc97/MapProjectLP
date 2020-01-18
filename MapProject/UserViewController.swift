//
//  UserViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 12/23/19.
//  Copyright © 2019 Juan Jimenez. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    var user : String!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var password: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(user)
        setInfo()
        ConfigUI()
        // Do any additional setup after loading the view.
    }
    
    
    func setInfo()  {
        NetworkManager.shared.getUser(for: user) { (userdb, ErrorMessage) in
            
            guard  let User = userdb else{
                         //let alert = UIAlertController(title: "algo salio mal " , message: errorMessage! , preferredStyle: .alert)
                         //self.present(alert, animated: true, completion: nil)
                         print( ErrorMessage!.rawValue)
                         return
                     }
            DispatchQueue.main.async {
                                          self.userName.text = User.usuario
                                          self.name.text =  User.nombre
                                          self.lastName.text  = User.apellido
                                          self.email.text =  User.email
                                          self.password.text  = "**********"
                                          
            }
            
            
                     
        }
    }
    
    
    
    
    @IBAction func DoneButton(_ sender: Any) {
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

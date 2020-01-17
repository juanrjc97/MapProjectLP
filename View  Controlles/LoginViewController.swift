//
//  LoginViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/16/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@available(iOS 13.0, *)
class LoginViewController: UIViewController {

    
    
    
    var userLogin : UserNet?
    
    @IBOutlet weak var EmailLbl: UITextField!
    
    
    @IBOutlet weak var PasswordLbl: UITextField!
    
    @IBOutlet weak var LoginBtn: UIButton!
    
    
    @IBOutlet weak var ErrorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func LoginBtn(_ sender: UIButton) {
        
        //validate text fields
        
        //signing in the user

        let username = EmailLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //let password = PasswordLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        
        //validate the fields
        let error = validateFields()
        if error  != nil {
            
            showError(error!)
        }else{
            
            //crearlo en la base  de datos
           //obtengo un usuario con su :usuario: registrado en la base
            NetworkManager.shared.getUser(for: username) { (user, errorMessage) in
                       guard  let user = user else{
                        
                        self.showError( errorMessage!.rawValue)
                           return
                       }
                       print(user)
                self.userLogin = user
                print(self.userLogin)
                      
                   }
            
            //transtion to home
            //self.goHome(user : userLogin!)
            // self.goHome()
           
        }
        
        
        
        
    }
    
    
    
    
    
    
    func showError(_ message: String)  {
        ErrorLbl.text = message
        ErrorLbl.alpha = 1
    }
    
    func setUpElements()  {
        ErrorLbl.alpha =  0
        
        //style
        Utilities.styleTextField(EmailLbl)
        Utilities.styleTextField(PasswordLbl)
        Utilities.styleFilledButton(LoginBtn)
        
    }

    func goHome(user : UserNet)  {
          
          guard  let homeviewController  =  storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeViewController else {return}
          view.window?.rootViewController = homeviewController
         homeviewController.user = user
        
          view.window?.makeKeyAndVisible()
          
          
      }
    
    //check the fields and  validate the data
       func validateFields() -> String? {

           //check that all fields are filled in
           
           if PasswordLbl.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
              EmailLbl.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
               
               return "Please fill in all fields"
           }
           
           //check if the password is secure
           
           let cleanedPassoword   = PasswordLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           
           if Utilities.isPasswordValid(cleanedPassoword)  == false {
               
               return "Please make sure that your password is at least 8  characters, contains a special character and number"
               
           }

           return nil
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

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
        //userLogin()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func LoginBtn(_ sender: UIButton) {
        
        
        
        
        
       //guard  let homeviewController  =  storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeViewController else {return}
           //view.window?.rootViewController = homeviewController
           //view.window?.makeKeyAndVisible()
       // present(homeviewController, animated: true, completion: nil)
        //validate text fields
        
        //signing in the user

        //validate the fields
        
        //cdesbloquear esto luego
        /*
        let error = validateFields()
        if error  != nil {
            print("no cambia de pestaña")
            showError(error!)
        }else{
            
           //obtengo un usuario con su :usuario: registrado en la base
            //print(iduser)
            //transtion to home//id : iduser
            let home = HomeViewController()
            
            home.username = "beto"
            self.goHome()
            // self.goHome()
           
        }*/
   
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "SendUser"){
               let displayVC = segue.destination  as! HomeViewController
            displayVC.username = EmailLbl.text
        }
    }
    
    func setUpElements()  {
          ErrorLbl.alpha =  0
          
          //style
          Utilities.styleTextField(EmailLbl)
          Utilities.styleTextField(PasswordLbl)
          Utilities.styleFilledButton(LoginBtn)
          
      }
    
    /*
    func showError(_ message: String)  {
        ErrorLbl.text = message
        ErrorLbl.alpha = 1
    }
    
  
//user : UserNet
    //id : Int
    func goHome( )  {
          
          guard  let homeviewController  =  storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeViewController else {return}
          view.window?.rootViewController = homeviewController
       
        
          view.window?.makeKeyAndVisible()
          
          
      }
    
    //check the fields and  validate the data
        func validateFields() -> String? {
           //check that all fields are filled in
           
           if PasswordLbl.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
              EmailLbl.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
               
               return "Please fill in all fields"
           }
           
           let cleanedPassoword   = PasswordLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           let username = EmailLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           var  validPassword  : String = ""
 
         
        //print("vacio?" , validPassword)
        //validPassword == ""
        if  self.userLogin == nil {
            
            NetworkManager.shared.getUser(for: username) { (user, errorMessage) in
                            guard  let user = user else{
                             
                             self.showError( errorMessage!.rawValue)
                               return
                            }
                     
                      //passwordDb = user.contrasena
                      if user.contrasena.trimmingCharacters(in: .whitespacesAndNewlines) != cleanedPassoword {
                          
                          self.userLogin = nil
                          print(validPassword)
                      }else{
                      

                      }

                  }
            print(validPassword)
            //return  validPassword
           
        }else{
            validPassword = "The password is incorrect"
             return validPassword
        }
        
        
           return nil
       }
    
    
    
    
    */
}

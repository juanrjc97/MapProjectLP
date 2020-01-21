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
    
    var validUser : Bool = false;
    
    
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
        
        let username  = EmailLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //validate the fields
        let error = validateFields()
        if error  != nil {
            showError(error!)
        }else if validUser == false{
            
            validateUserDB(username: username, password: password)
        }else if validUser == true{
             goHome(username: username);
            
        }
   
    }
    
    
    func validateUserDB(username : String , password : String){
       
            NetworkManager.shared.getUser(for:username) { (user, errorMessage) in
                        guard  let user = user else{
                        DispatchQueue.main.async {
                          self.ErrorLbl.text = errorMessage!.rawValue
                          self.ErrorLbl.alpha = 1
                         self.showError( errorMessage!.rawValue)
                                                     
                         }
                      
                        return
                       }
                if user.contrasena == password{
                    self.validUser = true
                }

        }
            
    }
    
    func goHome(username : String  )  {
          
          guard  let homeviewController  =  storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeViewController else {return}
            homeviewController.username = username
          view.window?.rootViewController = homeviewController
          view.window?.makeKeyAndVisible()
          
          
      }
    
      func showError(_ message: String)  {
          ErrorLbl.text = message
          ErrorLbl.alpha = 1
      }
    
    //check the fields and  validate the data
        func validateFields() -> String? {
           //check that all fields are filled in
           
           if PasswordLbl.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
              EmailLbl.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
               print("no entra")
               return "Please fill in all fields"
           }else{
           
                return nil
            
            }
           
           /*let cleanedPassoword   = PasswordLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           let username = EmailLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           var  validPassword  : String = ""*/
            
       
       }
    
    func setUpElements()  {
             ErrorLbl.alpha =  0
             
             //style
             Utilities.styleTextField(EmailLbl)
             Utilities.styleTextField(PasswordLbl)
             Utilities.styleFilledButton(LoginBtn)
             
         }
    
    
}


/* esto valida que el usuario este ne la base
 NetworkManager.shared.getUser(for:username) { (user, errorMessage) in
                                      guard  let user = user else{
                                        self.ErrorLbl.text = errorMessage!.rawValue
                                        self.ErrorLbl.alpha = 1
                                       //self.showError( errorMessage!.rawValue)
                                         return
                                      }
                                if user.contrasena.trimmingCharacters(in: .whitespacesAndNewlines) != password {
                                    self.ErrorLbl.text = "Password Inconrrect"
                                    self.ErrorLbl.alpha = 1
                                    
                                }else{
                                
                                let home = HomeViewController()
                                home.username = username
                                self.performSegue(withIdentifier: "SendUser", sender: self)
                                    

                                }

                            }
 */

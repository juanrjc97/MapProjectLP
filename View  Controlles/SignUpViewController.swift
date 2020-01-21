//
//  SignUpViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/16/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@available(iOS 13.0, *)
class SignUpViewController: UIViewController {
    
    
    var validUser : Bool = false
    
    var usuarioLog : UserNet!

    @IBOutlet weak var FirstNameTxT: UITextField!
    
    
    @IBOutlet weak var LastNameTxT: UITextField!
    
    @IBOutlet weak var UserNameTxT: UITextField!
    
    
    @IBOutlet weak var EmailTxT: UITextField!
    
    @IBOutlet weak var PasswordTxt: UITextField!
    
    @IBOutlet weak var SignUpBtn: UIButton!
    
    
    @IBOutlet weak var ErrorLbl: UILabel!
    
    
    
    override func viewDidLoad() {
          super.viewDidLoad()
          
          setUpElements()
          // Do any additional setup after loading the view.
      }
    
  
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
       // print(UserNameTxT.text)
        
        let firstname = FirstNameTxT.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastname = LastNameTxT.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = EmailTxT.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let username = UserNameTxT.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //validate the fields
        let error = validateFields()
        if error  != nil {
            
            showError(error!)
        }else{
            
            usuarioLog = UserNet(nombre: firstname, apellido: lastname, usuario: username, contrasena: password, email: email)
            //crearlo en la base  de datos
            createUserDB(user: usuarioLog)

            //transtion to home
            goHome(username: username)
            }
        
        
    }
    
    func createUserDB(user: UserNet){
          
        NetworkManager.shared.addUser(for: user) { (result) in
            switch result {
            case .success( _):
                DispatchQueue.main.async {
                 self.ErrorLbl.text = "User created"
                 self.ErrorLbl.alpha = 1
                }
                
            
            case .failure(let error):
                DispatchQueue.main.async {
                 self.ErrorLbl.text = error.rawValue
                 self.ErrorLbl.alpha = 1
                 self.showError( error.rawValue)
                                            
                }
                
                
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
        //ErrorLbl.text = message
        ErrorLbl.alpha = 1
    }
    
    //check the fields and  validate the data
    func validateFields() -> String? {
        
        
        //check that all fields are filled in
        
        if FirstNameTxT.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           LastNameTxT.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           EmailTxT.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           UserNameTxT.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
        }
        
        //check if the password is secure
        
        let cleanedPassoword   = PasswordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassoword)  == false {
            
            return "Please make sure that your password is at least 8  characters, contains a special character and number"
            
        }
        
        
        return nil
    }
    

    func setUpElements()  {
        //hide the label
        ErrorLbl.alpha = 0
        Utilities.styleTextField(UserNameTxT)
        Utilities.styleTextField(FirstNameTxT)
        Utilities.styleTextField(LastNameTxT)
        Utilities.styleTextField(EmailTxT)
        Utilities.styleTextField(PasswordTxt)
        Utilities.styleFilledButton(SignUpBtn)
    }

    
    /*
     
     func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               
               if(segue.identifier == "SignSendUser"){
                      let displayVC = segue.destination  as! HomeViewController
                   displayVC.username = UserNameTxT.text?.trimmingCharacters(in: .whitespaces)
               }
            }
     
     */
    

}

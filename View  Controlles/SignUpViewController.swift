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
    
    var usuarioLog : UserNet?
    static var idUser  : Int!

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
            
            NetworkManager.shared.addUser(for: usuarioLog!) { (result) in
                            print("Ingreso de Usuario")
                            
                        switch result {
                            case .success(let usuario):
                                print("funciona el .suceess")
                                let home = self.storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeViewController
                                home?.username = username
                                self.present(home!, animated: true)
                                print(usuario)
                                
                            case .failure(let error):
                                self.showError(error.rawValue)
                            }
            }
            
            //transtion to home
       
            }
        
        
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

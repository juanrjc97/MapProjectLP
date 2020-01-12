//
//  CamaraViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/7/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import UIKit

class CamaraViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) { //esto significa que podemos usar la camara de usuario
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self //significa  que esta clase  es su propia de delegada que significa que puede controllar la camara
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
        }
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                 
                   if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                       print("funciona")
                       
                   }
                   
                   //esto toma la obteniene la imagen que se capturo la guarda en una constante pickedImage y luego lo añade al ImageView
                  
                   
                   dismiss(animated: true, completion: nil)
                   
                   
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

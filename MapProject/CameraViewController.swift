//
//  CameraViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/6/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var TrashPhoto: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) { //esto significa que podemos usar la camara de usuario
       
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self  //significa  que esta clase  es su propia de delegada que significa que puede controllar la camara
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
        }

        // Do any additional setup after loading the view.
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        //esto toma la obteniene la imagen que se capturo la guarda en una constante pickedImage y luego lo añade al ImageView
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
           // MyImage.contentMode = .scaleToFill
            TrashPhoto  = pickedImage
            
        }
        
        picker.dismiss(animated: true, completion: nil)
        
        
    }
    
    



}

/*

if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) { //esto significa que podemos usar la camara de usuario
               var TrashPhoto: UIImage!
               let imagePicker = UIImagePickerController()
               imagePicker.delegate = self  //significa  que esta clase  es su propia de delegada que significa que puede controllar la camara
               imagePicker.sourceType = UIImagePickerController.SourceType.camera
               imagePicker.allowsEditing = false
               self.present(imagePicker, animated: true, completion: nil)
         
         //UIViewController top = [UIApplication sharedApplication].keyWindow.rootViewController;
         //[top presentViewController:secondView animated:YES completion: nil];
         
 //esta funcion interna hace que lo que se obtien  de la camara se agregue a la imagen que se crea al hacer el longPressGesture
         func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                
                
                //esto toma la obteniene la imagen que se capturo la guarda en una constante pickedImage y luego lo añade al ImageView
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                    TrashPhoto = pickedImage
                let location = gestureReconizer.location(in: mapView)
                let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
                 //creando las coordenadas de los basureros del usuario
                let trashCoord = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
                 //add anotation
                let annotation  =  MKPointAnnotation()  //MKAnnotationView()
                 annotation.coordinate = coordinate
                 annotation.title = "Basurero"
                 // con anotation .tittle le ponemos el titulo a la anotatcion en el mapa aqui aplicar reverse location
                 mapView.addAnnotation(annotation)
                 user?.AddUserAnnotations(coordenadas: trashCoord)
                }
                
                user?.AddUserImages(imagen: TrashPhoto)
                picker.dismiss(animated: true, completion: nil)
                
            }
         
           }
 

*/

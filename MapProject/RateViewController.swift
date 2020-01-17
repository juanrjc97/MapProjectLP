//
//  RateViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/11/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {

    @IBOutlet var starsBtn: [UIButton]!
     var rate : Int = 0  ;
    var  punto : PointNet!
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(punto?.location)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func DidTapStar(_ sender: UIButton) {
        
        print("Rated \(sender.tag) star")  //muestra a que le diste tap
        rate = sender.tag
               for star in starsBtn {
                   if star.tag <= sender.tag {
                       star.setBackgroundImage(  UIImage.init(named: "fullStar"), for: .normal) //seleceted star
                       star.isUserInteractionEnabled = false;
                   }else{
                       star.setBackgroundImage( UIImage.init(named: "estrella"), for: .normal)
                       
                   }
                   
               }
    }
    
    
    @IBAction func DidTapCancel(_ sender: UIButton) {
       
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DidTapSubmit(_ sender: UIButton) {
        punto.sumaCalificacion = rate
        print(punto)
                //calificacion / id
        NetworkManager.shared.updateRating(for:  punto) { (result) in
                         switch result {
                                                                    
                                case .failure(let error):
                                        print(error.rawValue)
                                case .success(_):
                                        print("el rating se actualizo con exito")
                            }
                    
        }
        
         print("this trash has " , rate , "stars")
        //punto?.rate =  rate
        //print( "Estrellas" ,  punto?.rate)
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

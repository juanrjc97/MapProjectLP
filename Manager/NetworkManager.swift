//
//  NetworkManager.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/12/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared   = NetworkManager()
    let baseURL = "http://192.168.100.14:8000/usuarios/"
    
    private init(){}
    
    
    func getUser(for username : String, completed: @escaping (UserNet? , ErrorMessage?) -> Void) {
        
        //http://127.0.0.1:8000/usuarios/brcetuti/
        //http://127.0.0.1:8000/usuarios/brcetuti/
        //http://0.0.0.0:8000/usuarios/
        let endpoint  = baseURL + "\(username)/"
        
        guard let url = URL(string: endpoint) else{
            completed(nil, .invalidUsername)
            return
        }
        let task = URLSession.shared.dataTask(with: url){data , response, error in
            
            if let _ = error{
                completed(nil,.unableToComple)
                return
            }
            
 
            guard let response =  response as?  HTTPURLResponse, response.statusCode ==  200 else{
                completed(nil, .InvalidResponse)
                return
                
            }
            
            guard let data = data else{
                completed(nil,.invalidData)
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user =  try decoder.decode(UserNet.self, from: data)
                completed( user, nil)
                
            }catch{
                completed(nil,.invalidData)
                
            }
            
        }

        task.resume()
    }
    
    
    
    
    
    
    
    
    
}

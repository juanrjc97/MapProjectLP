//
//  NetworkManager.swift
//  MapProject
//
//  Created by Juan Jimenez on 1/12/20.
//  Copyright © 2020 Juan Jimenez. All rights reserved.
//

import Foundation

class NetworkManager {
     // urls usadas
    //http://127.0.0.1:8000/usuarios/brcetuti/
    //http://0.0.0.0:8000/usuarios/
    //http://192.168.100.14:8000/puntoRecoleccion/
    //http://192.168.100.14:8000/noticia/
    
    
    static let shared   = NetworkManager()
    let baseURL = "http://192.168.100.14:8000/usuarios/"
    
    let baseUrlpoints = "http://192.168.100.14:8000/puntoRecoleccion/"
    
    let baseUrlNoticiasTips = "http://192.168.100.14:8000/noticia/"
    
    let baseUrlhorarios = "http://192.168.100.14:8000/horarioRecoleccion/"
    
    
    private init(){}
    
    
    func getUser(for username : String, completed: @escaping (UserNet? , ErrorMessage?) -> Void) {
        
        
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
    
    
    func getMarcadores(completed: @escaping ([PointNet]? , ErrorMessage?) -> Void){
        
        guard let url = URL(string: baseUrlpoints) else{
                   completed(nil, .invalidRequest)
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
                       let pointNet =  try decoder.decode([PointNet].self, from: data)
                       completed( pointNet, nil)
                       
                   }catch{
                       completed(nil,.invalidData)
                       
                   }
                   
               }

               task.resume()
    }
    
    func getMarcador(for idMarcador : Int ,completed: @escaping (PointNet? , ErrorMessage?) -> Void){
        
        let endpoint  = baseUrlpoints + "\(idMarcador)/"
        
        guard let url = URL(string: endpoint) else{
                          completed(nil, .invalidRequest)
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
                              let pointNet =  try decoder.decode(PointNet.self, from: data)
                              completed( pointNet, nil)
                              
                          }catch{
                              completed(nil,.invalidData)
                              
                          }
                          
                      }

                      task.resume()
    }
    
    func getHorarios(completed: @escaping ( [HorariosNet]? , ErrorMessage?) -> Void){
        
        guard let url = URL(string: baseUrlhorarios) else{
                          completed(nil, .invalidRequest)
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
                              let horarios =  try decoder.decode([HorariosNet].self, from: data)
                              completed( horarios, nil)
                              
                          }catch{
                              completed(nil,.invalidData)
                              
                          }
                          
                      }

                      task.resume()
      
    }
    
    func getNoticias(for tipoNoticia : String ,completed: @escaping ([NoticiasNet]? , ErrorMessage?) -> Void){
        
         let endpoint  = baseUrlNoticiasTips + "\(tipoNoticia)/"
        
        guard let url = URL(string: endpoint) else{
                                 completed(nil, .invalidRequest)
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
                                     let noticias =  try decoder.decode([NoticiasNet].self, from: data)
                                     completed( noticias, nil)
                                     
                                 }catch{
                                     completed(nil,.invalidData)
                                     
                                 }
                                 
                             }

                             task.resume()
        
    }
    
    
    
    func getTips(for tipoNoticia : String ,completed: @escaping ([NoticiasNet]? , ErrorMessage?) -> Void){
        
        let endpoint  = baseUrlNoticiasTips + "\(tipoNoticia)/"
        
        guard let url = URL(string: endpoint) else{
                   completed(nil, .invalidRequest)
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
                       let tips =  try decoder.decode([NoticiasNet].self, from: data)
                       completed( tips, nil)
                       
                   }catch{
                       completed(nil,.invalidData)
                       
                   }
                   
               }

               task.resume()
 
    }
    
    //hacer metodos put para añadir la calificacion de los basureros
    //hacer metodo push usuario y para y añadir puntos
    
    func addUser(for user : UserNet , completed: @escaping (ErrorMessage?) -> Void){
        
        guard let url = URL(string: baseURL) else{
            completed(.invalidRequest)
            return
          }
        
        do{
            var request = URLRequest(url: url)
            request.httpMethod =  "POST"
            request.httpBody =  try JSONEncoder().encode(user)
            
            let task = URLSession.shared.dataTask(with: url){data , response, error in
                //manejando errores de la peticion httpRequest
               if let _ = error{
                   completed(.unableToComple)
                   return
               }
                
                guard let response =  response as?  HTTPURLResponse, response.statusCode ==  200 else{
                    completed(.InvalidResponse)
                    return
                    
                }
                
                guard let data = data else{
                    completed(.invalidData)
                    return
                }
                do{
                    
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let user =  try decoder.decode(UserNet.self, from: data)
                    completed( nil) //todo correcto con la data
                    
                }catch{
                    
                    completed( .decodingProblem)
                    
                }

            }
            
            task.resume()
            
        }catch{
            completed(.encodignProblem)
            
        }
        
        
    }
    
    
    
    
    
}

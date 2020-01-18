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
    //http://127.0.0.1:8000/usuarios/
    //ips para usar desde la casa
    /*
        let baseURL = "http://192.168.100.14:8000/usuarios/"
        
        let baseUrlpoints = "http://192.168.100.14:8000/puntoRecoleccion/"
        
        let baseUrlNoticiasTips = "http://192.168.100.14:8000/noticia/"
        
        let baseUrlhorarios = "http://192.168.100.14:8000/horarioRecoleccion/"
     */
    
    
    //nueva http://0.0.0.0:8000/usuarios/
    //192.168.1.4
    //cambiaste la ip a la de la casa de miguel
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
    
    func getHorarios(completed: @escaping ( Result<[HorariosNet] , ErrorMessage>) -> Void){
        
        guard let url = URL(string: baseUrlhorarios) else{
                            completed(.failure(.unableToComple))
                          return
                      }
                      let task = URLSession.shared.dataTask(with: url){data , response, error in
                          
                          if let _ = error{
                               completed(.failure( .InvalidResponse))
                              return
                          }
                          
               
                          guard let response =  response as?  HTTPURLResponse, response.statusCode ==  200 else{
                                completed(.failure( .InvalidResponse))
                              return
                              
                          }
                          
                          guard let data = data else{
                              completed(.failure(.invalidData))
                              return
                          }
                          
                          do{
                              let decoder = JSONDecoder()
                              decoder.keyDecodingStrategy = .convertFromSnakeCase
                              let horarios =  try decoder.decode([HorariosNet].self, from: data)
                            completed( .success( horarios))
                              
                          }catch{
                             completed(.failure(.invalidData))
                              
                          }
                          
                      }

                      task.resume()
      
    }
    
    func getNoticias(completed: @escaping (Result<[NoticiasNet] , ErrorMessage>) -> Void){
        
         let endpoint  = baseUrlNoticiasTips
        
        guard let url = URL(string: endpoint) else{
            completed(.failure(.invalidRequest ) )
                                 return
                             }
                             let task = URLSession.shared.dataTask(with: url){data , response, error in
                                 
                                 if let _ = error{
                                    completed(.failure(.unableToComple))
                                     return
                                 }
                                 
                      
                                 guard let response =  response as?  HTTPURLResponse, response.statusCode ==  200 else{
                                    completed(.failure( .InvalidResponse))
                                     return
                                     
                                 }
                                 
                                 guard let data = data else{
                                    completed(.failure(.invalidData))
                                     return
                                 }
                                 
                                 do{
                                     let decoder = JSONDecoder()
                                     decoder.keyDecodingStrategy = .convertFromSnakeCase
                                     let noticias =  try decoder.decode([NoticiasNet].self, from: data)
                                    completed(.success(noticias)  )
                                     
                                 }catch{
                                    completed(.failure(.invalidData))
                                     
                                 }
                                 
                             }

                             task.resume()
        
    }
    
    
    
    //hacer metodo push usuario y para y añadir puntos
    
    func addUser(for user : UserNet , completed: @escaping (Result<[UserNet], ErrorMessage>) -> Void){
        
        guard let url = URL(string: baseURL) else{
            completed(.failure(.invalidRequest))
            return
          }
        
        do{//NSMutableURLRequest
            var request = URLRequest(url: url)
            request.httpMethod =  "POST" // application/json
            request.addValue("application/json", forHTTPHeaderField: "Acept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody =  try JSONEncoder().encode(user)
            
           
           
            
            let task = URLSession.shared.dataTask(with: request){data , response, error in
                //manejando errores de la peticion httpRequest
                //print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) )
                
               if let _ = error{
                completed(.failure(.unableToComple))
                   return
               }
                
                guard let response =  response as? HTTPURLResponse, response.statusCode ==  200 else{
                    completed( .failure(.InvalidResponse))
                   
                    return
                    
                    
                }
                print( response.statusCode)
                guard let data = data else{
                    completed(.failure(.invalidData))
                    return
                }
                do{
                    
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue), "aqui")
                    let users =  try decoder.decode([UserNet].self, from: data)
                    
                    //print(user)// NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    completed(.success(users)) //todo correcto con la data
                    
                }catch{
                    
                    completed(.failure(.decodingProblem))
                    
                }

            }
            
            task.resume()
            
        }catch{
            completed(.failure(.encodignProblem))
            
        }
        
        
    }
    
    
    func addPoint(for point : PointNet , completed: @escaping (Result<[PointNet], ErrorMessage>) -> Void){
        
        guard let url = URL(string: baseUrlpoints) else{
            completed(.failure(.invalidRequest))
            return
          }
        
        do{//NSMutableURLRequest
            var request = URLRequest(url: url)
            request.httpMethod =  "POST" // application/json
            request.addValue("application/json", forHTTPHeaderField: "Acept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody =  try JSONEncoder().encode(point)
 
            let task = URLSession.shared.dataTask(with: request){data , response, error in
                //manejando errores de la peticion httpRequest
                //print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) )
                 
               if let _ = error{
                completed(.failure(.unableToComple))
                   return
               }
                
                guard let response =  response as? HTTPURLResponse, response.statusCode ==  201 else{
                    completed( .failure(.InvalidResponse))
                   
                    return
                    
                    
                }
                //print( response.statusCode)
                guard let data = data else{
                    completed(.failure(.invalidData))
                    return
                }
                do{
                    
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue), "aqui")
                    let points =  try decoder.decode([PointNet].self, from: data)
                    
                    //print(user)// NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    completed(.success(points)) //todo correcto con la data
                    
                }catch{
                    
                    completed(.failure(.decodingProblem))
                    
                }

            }
            
            task.resume()
            
        }catch{
            completed(.failure(.encodignProblem))
            
        }
        
        
    }
    
    
    //hacer metodos put para añadir la calificacion de los basureros
    
    
    //hacer metodo delete para borrar un basurero marcado en el mapa
    
    func deletePoint(for id : Int , completed: @escaping (Result< String  ,ErrorMessage>) -> Void){

         let endpoint  = baseUrlpoints + "\(id)/"
        
          guard let url = URL(string: endpoint) else{
              completed(.failure(.invalidRequest))
              return
            }

              var request = URLRequest(url: url)
              request.httpMethod =  "DELETE" // application/json
              request.addValue("application/json", forHTTPHeaderField: "Acept")
              request.setValue("application/json", forHTTPHeaderField: "Content-Type")
              //request.httpBody =  try JSONSerialization.data(withJSONObject: id, options: [])

              let task = URLSession.shared.dataTask(with: request){data , response, error in
                  //manejando errores de la peticion httpRequest
                  //print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) )
                  
                 if let _ = error{
                  completed(.failure(.unableToComple))
                     return
                 }
                guard let response =  response as? HTTPURLResponse, response.statusCode ==  204  else{
                    
                     completed( .failure(.InvalidResponse))
                                 
                    return
                        }
                  
              }
              
              task.resume()
          
      }
    

    func updateRating(for point : PointNet, completed: @escaping (Result<[PointNet], ErrorMessage>) -> Void){
            
        let id =  point.idPunto
        let endpoint  = baseUrlpoints + "\(id ?? 0)/"
            guard let url = URL(string: endpoint) else{
                completed(.failure(.invalidRequest))
                return
              }
            
            do{//NSMutableURLRequest
                var request = URLRequest(url: url)
                request.httpMethod =  "PUT" // application/json
                request.addValue("application/json", forHTTPHeaderField: "Acept")
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody =  try JSONEncoder().encode(point)// data(withJSONObject: rating, options: [])
     
                let task = URLSession.shared.uploadTask(with: request, from: request.httpBody) { (data, response, error) in
                    
                   if let _ = error{
                                completed(.failure(.unableToComple))
                                   return
                               }
                                
                                guard let response =  response as? HTTPURLResponse, response.statusCode ==  200 else{
                                    completed( .failure(.InvalidResponse))
                                   
                                    return
                                    
                                }
                                //print( response.statusCode)
                    guard data != nil else{
                                    completed(.failure(.invalidData))
                                    return
                                }
                               
                    
                }
                
                task.resume()
                
            }catch{
                   completed(.failure(.encodignProblem))
                
        }
            
            
        }
       
}

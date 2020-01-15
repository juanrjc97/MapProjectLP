//
//  ViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 12/21/19.
//  Copyright © 2019 Juan Jimenez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController  {

    let locationManager = CLLocationManager()
    let regionInmeters : Double = 500
    
    @IBOutlet weak var GoDirecction: UIButton!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var directionsArray: [MKDirections] = []
    
    let transition = SlideInTrasition()
    
    //user i
    var user : User?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        checkLocationServices()
        mapView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleTap(gestureReconizer:)))
        longPressRecognizer.minimumPressDuration = 0.5
        
        mapView.addGestureRecognizer(longPressRecognizer)
        
        NetworkManager.shared.getUser(for: "brcetuti") { (user, errorMessage) in
            guard  let user = user else{
                //let alert = UIAlertController(title: "algo salio mal " , message: errorMessage! , preferredStyle: .alert)
                //self.present(alert, animated: true, completion: nil)
                print( errorMessage!.rawValue)
                return
            }
            
            print( user )
        }
        
        NetworkManager.shared.getMarcadores { (points, errorMessage) in
            guard  let points = points else{
                           //let alert = UIAlertController(title: "algo salio mal " , message: errorMessage! , preferredStyle: .alert)
                           //self.present(alert, animated: true, completion: nil)
                           print( errorMessage!.rawValue)
                           return
                       }
                       
                    self.setAnotations(puntos: points)
        }
        
        NetworkManager.shared.getMarcador(for : 1){ (point, errorMessage) in
                  guard  let point = point else{
                                 //let alert = UIAlertController(title: "algo salio mal " , message: errorMessage! , preferredStyle: .alert)
                                 //self.present(alert, animated: true, completion: nil)
                                 print( errorMessage!.rawValue)
                                 return
                             }
                             
                             print( point )
              }
       
        let  usuario = UserNet.init(idUsuario: 0, nombre: "beto", apellido: "melenas", usuario: "beto97", contrasena: "1234", email: "beto90@gmail,com")
        
        NetworkManager.shared.addUser(for: usuario) { (result) in
            print("Ingreso de Usuario")
            
            switch result {
            case .success(let usuario):
                
                print(usuario)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        
            NetworkManager.shared.getNoticias { (noticias, errorMessage) in
                guard  let noticias = noticias else{
                                          //let alert = UIAlertController(title: "algo salio mal " , message: errorMessage! , preferredStyle: .alert)
                                          //self.present(alert, animated: true, completion: nil)
                                          print( errorMessage!.rawValue)
                                          return
                                      }
                                      
                                   print(noticias)
                
            }
            
          
            
        }
        
        
        
        //inicalizar usuario
        self.user = User()
        
    }
    
    //accion de mostrar menu
    
    @IBAction func didTapMenu(_ sender: UIButton) {
        
        //let camaraViewController = storyboard?.instantiateViewController(withIdentifier: "Camara")
       //present(camaraViewController!, animated: true, completion: nil)
        
        
        guard let menuViewController =  storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as?
            MenuViewController else {return}
        
        menuViewController.didTapMenuType = { menuType in
            self.newTapMenu(menuType)
            
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
        
    }
    
    
    
      func newTapMenu(_ menuType : MenuType) {
         switch menuType {
         case .user:
            guard let userController =  storyboard?.instantiateViewController(withIdentifier: "UserViewController") else {return}
            present(userController, animated: true, completion: nil)
         case .news:
            guard let newsController =  storyboard?.instantiateViewController(withIdentifier: "NewsViewController") else {return}
            present(newsController, animated: true, completion: nil)
             //print("show news ")
         case .tips:
            guard let tipsController =  storyboard?.instantiateViewController(withIdentifier: "TipsViewController") else {return}
            present(tipsController, animated: true, completion: nil)
             //print("show tips ")
         case .horarios:
            guard let ScheduleController =  storyboard?.instantiateViewController(withIdentifier: "HorariosController") else {return}
            present(ScheduleController, animated: true, completion: nil)
         case .map:
             break
         }
     }
    
    //metodos del mapa
    
    func setUpLocactionManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func CenterViewOnUserLocation() {
        
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init( center:location, latitudinalMeters: regionInmeters, longitudinalMeters:regionInmeters )
            mapView.setRegion(region, animated: true)
            
        }
        
    }
    
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled() {
            //setear el location manager
            
            setUpLocactionManager()
            checkForAuthorization()
        }else{
            //mostrar un alert para que el usario vaya a prender los servicios de localizacion
            
        }
        
    }

    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
          let latitude = mapView.centerCoordinate.latitude
          let longitude = mapView.centerCoordinate.longitude
          
          return CLLocation(latitude: latitude, longitude: longitude)
      }
    
    
    func getDirections() {
          guard let location = locationManager.location?.coordinate else {
              //TODO: Inform user we don't have their current location
              return
          }
          
          let request = createDirectionsRequest(from: location)
          let directions = MKDirections(request: request)
          resetMapView(withNew: directions)
        //aqui se puede dar un error manejarlo luego
          
          directions.calculate { [unowned self] (response, error) in
              //TODO: Handle error if needed
              guard let response = response else { return } //aqui tambien se podria manejar otro error "response not avilable"
              
              for route in response.routes {
                print("nain  line 84")
                  self.mapView.addOverlay(route.polyline)// esto setea la linea que sale en el mapa entre dos  puntos
                  self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
              }
          }
      }
      
      
      func createDirectionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
          let destinationCoordinate       = getCenterLocation(for: mapView).coordinate
          let startingLocation            = MKPlacemark(coordinate: coordinate)
          let destination                 = MKPlacemark(coordinate: destinationCoordinate)
          
          let request                     = MKDirections.Request()
          request.source                  = MKMapItem(placemark: startingLocation)
          request.destination             = MKMapItem(placemark: destination)
          request.transportType           = .automobile
          request.requestsAlternateRoutes = true  // pueden existir muchas rutas a  un mismo lugar con esto calcula  todas las rutas
          
          return request
      }
      
    func resetMapView(withNew directions: MKDirections) {
          mapView.removeOverlays(mapView.overlays)
          directionsArray.append(directions)
          let _ = directionsArray.map { $0.cancel() }
      }
    
  @IBAction func GoButtonAction(_ sender: UIButton) {
        // getDirections()
         //print("respuesta boton")
     }
    
    
    func checkForAuthorization(){
        
        switch CLLocationManager.authorizationStatus() {
            
        case .authorizedWhenInUse:
            //mapView.showsUserLocation = true //tambien se puse hacer desde el storyboard
            CenterViewOnUserLocation()
            locationManager.startUpdatingLocation()
            //activar el mapa
           
            break
        case .denied:
            //mostrar instrucciones para que puedan activar los permisos de ubicacion
            break
        case .restricted:
            //mostrar un alert diciendo porque esta restrigido
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        
        case .authorizedAlways:
                //no es necesario para esta app
            break
        }
        
    }

    //aqui comienza  el reconocimiento de gestos
    
   @objc func handleTap( gestureReconizer: UILongPressGestureRecognizer){
    //feddback
      let generator = UIImpactFeedbackGenerator(style: .heavy)
        //let Fatherpoint = MKAnnotationView()
        //Fatherpoint.annotation?.coordinate = coordinate
        // con anotation .tittle le ponemos el titulo a la anotatcion en el mapa aqui aplicar reverse location
    if gestureReconizer.state == .ended{
        
             let location =    gestureReconizer.location(in: self.mapView)  //  gestureReconizer.location(in: mapView)
              let coordinate = self.mapView.convert(location, toCoordinateFrom: self.mapView)
              //creando las coordenadas de los basureros del usuario
              let trashCoord = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
              //add anotation
              let annotation  =  MKPointAnnotation()  //MKAnnotationView()
              annotation.coordinate = coordinate
              annotation.title = "Basurero"
              annotation.subtitle = "Rating Stars ⭐"
        
                user?.AddUserAnnotations(coordenadas: trashCoord)
                generator.impactOccurred()
              mapView.addAnnotation(annotation)
             
        }
    
    }
    
    func setAnotations(puntos: [PointNet]) -> Void {
        
        for  punto  in  puntos {
            let annotation = MKPointAnnotation()
            //print(Double(punto.latitud)) //(myString as NSString).doubleValue
            annotation.coordinate = CLLocationCoordinate2D(latitude: (punto.latitud as NSString).doubleValue
                , longitude: (punto.longitud as NSString).doubleValue)
            annotation.title = "Basurero"
            annotation.subtitle = "\(punto.sumaCalificacion) Stars ⭐"
            mapView.addAnnotation(annotation)
        }
        
    }
    
    
}




extension HomeViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         // hace algo cada vez que la ubicacion se actualiza en el  mapa
        guard let location = locations.last else{ return }// si no entra aqui el resto del codigo no se ejecuta
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) // location es la ultima ubicacion registrada del usuario
        let region = MKCoordinateRegion.init( center: center , latitudinalMeters: regionInmeters, longitudinalMeters:regionInmeters )
        
        mapView.setRegion(region, animated : true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
         //si el usuario ya no quiere que se lo ubique en el mapa
        checkForAuthorization()
    }
    
    
      func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        print("nopinta")
         let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
         renderer.strokeColor = .red
         
         return renderer
     }
    
}

extension HomeViewController : MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView") // cambiar esta variable a tipo var
        //cuando quieras  cambiar el icono de marcado en el mapa
        if annotation is MKUserLocation{
            return  nil
        }
        
        if annotationView == nil{
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView") //descomentar esto
            //si quieres cambiar el icono del mapa
        }
        if annotation.title == "Basurero"{
            annotationView?.image = UIImage(named: "basura")
             annotationView?.canShowCallout = true
            if #available(iOS 13.0, *) {
                annotationView?.rightCalloutAccessoryView = UIButton(type : .close)
            } else {
                // Fallback on earlier versions
            }
            annotationView?.leftCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            
        }
        
        annotationView?.canShowCallout = true
       
        
        return annotationView;
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if control == view.rightCalloutAccessoryView {
            let annView = view.annotation! //aqui recupero la anotacion de mapa a la que le di tap
                  //let rateViewController = storyboard?.instantiateViewController(withIdentifier: "RateView")
                  // present(rateViewController!, animated: true, completion: nil)
                   mapView.removeAnnotation(annView)
        }else if control == view.leftCalloutAccessoryView{
            let annView = view.annotation!
            
            let rateViewController = storyboard?.instantiateViewController(withIdentifier: "RateView") as?
            RateViewController 
            present(rateViewController!, animated: true, completion: nil)
            
            rateViewController?.punto = Point(rating: 0, location : annView.coordinate)
            
            
            

        }
       
        
        
    }
    
    
    
}

extension HomeViewController : UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting  = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting  = false
              return transition
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

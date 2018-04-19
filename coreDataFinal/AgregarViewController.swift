//
//  AgregarViewController.swift
//  coreDataFinal
//
//  Created by Jorge Maldonado Borbón on 23/09/17.
//  Copyright © 2017 Jorge Maldonado Borbón. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
class AgregarViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var nombre: UITextField!
    
    @IBOutlet weak var descripcion: UITextField!
    
    var manager = CLLocationManager()
    var latitud : CLLocationDegrees!
    var longitud: CLLocationDegrees!
    
    @IBOutlet weak var verCoordenadas: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.latitud = location.coordinate.latitude
            self.longitud = location.coordinate.longitude
        }
    }
   
    @IBAction func obtenerCoordenadas(_ sender: Any) {
        verCoordenadas.setTitle("Lat: \(latitud!) - Long:\(longitud!)", for: .normal)
    }
    
    @IBAction func guardar(_ sender: UIButton) {
        
        let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let entityLugares = NSEntityDescription.insertNewObject(forEntityName: "Lugares", into: contexto) as! Lugares
        
        entityLugares.nombre = nombre.text
        entityLugares.descripcion = descripcion.text
        entityLugares.latitud = latitud
        entityLugares.longitud = longitud
        
        //SELECT * FROM Lugares ORDER BY id desc LIMIT 1
        let fetchResult : NSFetchRequest<Lugares> = Lugares.fetchRequest()
        let orderById = NSSortDescriptor(key: "id", ascending: false)
        fetchResult.sortDescriptors = [orderById]
        fetchResult.fetchLimit = 1
        
        do {
           let idResult = try contexto.fetch(fetchResult)
            let id = idResult[0].id + 1
            entityLugares.id = id
        } catch let error as NSError {
            print("hubo un error", error)
        }
        
        do {
            try contexto.save()
            print("guardo")
        } catch let error as NSError {
            print("no guardo", error)
        }
        
    }
    
}
















//
//  ImgenVistaViewController.swift
//  coreDataFinal
//
//  Created by Jorge Maldonado Borbón on 23/09/17.
//  Copyright © 2017 Jorge Maldonado Borbón. All rights reserved.
//

import UIKit
import CoreData
class ImgenVistaViewController: UIViewController {

    @IBOutlet weak var imagen: UIImageView!
    
    var imagenLugar : Imagenes!
    override func viewDidLoad() {
        super.viewDidLoad()

        imagen.image = UIImage(data: imagenLugar.imagenes! as Data)
    }

   
    @IBAction func eliminar(_ sender: UIButton) {
        
        let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest : NSFetchRequest<Imagenes> = Imagenes.fetchRequest()
        let id = imagenLugar.id
        fetchRequest.predicate = NSPredicate(format: "id == %@", id! as CVarArg)
        
        let objeto = try! contexto.fetch(fetchRequest)
        for res in objeto {
            contexto.delete(res)
        }
        
        do {
            try contexto.save()
            navigationController?.popViewController(animated: true)
        } catch let error as NSError {
            print("no elimino", error)
        }
        
    }
    
}











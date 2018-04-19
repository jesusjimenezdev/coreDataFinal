//
//  VistaImagenViewController.swift
//  coreDataFinal
//
//  Created by Jorge Maldonado Borbón on 23/09/17.
//  Copyright © 2017 Jorge Maldonado Borbón. All rights reserved.
//

import UIKit

class VistaImagenViewController: UIViewController {

    var imagenes : Imagenes!
    
    @IBOutlet weak var imagen: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func eliminar(_ sender: UIButton) {
    }
}

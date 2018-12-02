//
//  ThirdViewController.swift
//  03 Coding
//
//  Created by antoniogamez on 2/12/18.
//  Copyright © 2018 Adhoc. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    // Definimos nuestras variables globales
    var families : [String] = []
    var fonts : [String: [String]] = [:]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Asignamos las familias disponibles al array families
        families = UIFont.familyNames
        // For que asigna la fuente a la familia que estemos viendo
        for fam in families{
            fonts[fam] = UIFont.fontNames(forFamilyName: fam)
        }
        print(fonts)
    }

}

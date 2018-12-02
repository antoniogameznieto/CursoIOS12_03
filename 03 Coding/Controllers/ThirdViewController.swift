//
//  ThirdViewController.swift
//  03 Coding
//
//  Created by antoniogamez on 2/12/18.
//  Copyright © 2018 Adhoc. All rights reserved.
//

import UIKit

// El UITableViewDelegate es para delegar acciones
// El UITableViewDataSource proporciona la fuente de datos
class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    // Definimos nuestras variables globales
    var families : [String] = []              // Definimos array tipo string para las familias
    var fonts : [String: [String]] = [:]     // Definimos array tipo string para las fuentes
    
    // Definimos los IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // Método viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Asignamos las familias disponibles al array families
        families = UIFont.familyNames
        // Ordena y devuelve un string
        families = UIFont.familyNames.sorted(by: { return $1 > $0 })
        // For que asigna la fuente a la familia que estemos viendo
        for fam in families{
            fonts[fam] = UIFont.fontNames(forFamilyName: fam)
        }
        // Imprimimos el resultado por consola
        print(fonts)
    }
    
    // MARK: Métodos del protocolo UITableViewDataSource
    
    // Le dice a la tabla: "Prepara una sección sólo"
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Nos dice cuantas filas tiene la sección. Son las familias de fuentes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.families.count
    }
    
    // El sistema reutiliza las celdas. A cada celda se le da un identificador
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Variable para la asignación de la celda que le corresponda
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontFamilyCell", for: indexPath)
        // Asignamos la fuente que corresponda a su variable
        let fontFamily = families[indexPath.row]
        // Cambiamos el texto de la celda por el que le corresponda
        cell.textLabel?.text = fontFamily
        cell.textLabel?.font = UIFont(name: fontFamily, size: 20.0)
        return cell
    }
    
    
}

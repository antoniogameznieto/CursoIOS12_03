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
        // For que asigna la fuente a la familia que estemos viendo
        for fam in families{
            fonts[fam] = UIFont.fontNames(forFamilyName: fam)
        }
        // Imprimimos el resultado por consola
        print(fonts)
    }
    
    // MARK: Métodos del protocolo UITableViewDataSource
    
    // Este sirve para saber las secciones que tiene las tablas. De momento sólo hay una sección
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Este sirve para decidir cuantas filas vamos a tener por sección. Serán tantas filas como familias de fuentes habrá
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.families.count
    }
    
    // El sistema reutiliza las celdas. A cada celda se le da un identificador
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontFamilyCell", for: indexPath)
        cell.textLabel?.text = families[indexPath.row]
        return cell
    }
    
    
}

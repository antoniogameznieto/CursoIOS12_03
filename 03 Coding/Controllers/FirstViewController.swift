//
//  FirstViewController.swift
//  03 Coding
//
//  Created by antoniogamez on 2/12/18.
//  Copyright © 2018 Adhoc. All rights reserved.
//

import UIKit

// Hemos añadido al firstViewControler el permiso para que los textboxes
// deleguen funciones al controlador
class FirstViewController: UIViewController, UITextFieldDelegate {
    
    // IB Outlets
    @IBOutlet weak var labelEdad: UILabel! // Etiqueta de Edad
    @IBOutlet weak var sliderEdad: UISlider! // Slider de Edad
    
    // Definimos variables globales
    var edadUsuario : Int = -1 // Edad del usuario
    
    // Método de carga del firstViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Llamamos a la función que actualiza la edad en la etiqueta
        self.actualizarEtiquetaEdad()
        
    }
    
    // ¿Que pasa cuando pulsamos un enter en el textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Cierra el teclado
        textField.resignFirstResponder()
        // Recuperamos el contenido del texfield si es que existe
        if textField.text != nil { // Si el contenido del textField está lleno
            // Imprimimos con consola el texto del textfield
            print(textField.text as Any)
        }
        // Finalizamos la edición del textField
        return true
    }
    
    // Metodo cambio valor del slider
    @IBAction func sliderEdadMoved(_ sender: UISlider) {
        // Llamamos a la función que actualiza la edad en la etiqueta
        self.actualizarEtiquetaEdad()
    }
    
    func actualizarEtiquetaEdad(){
        // Leemos el valor del slider y lo asignamos
        edadUsuario = Int(self.sliderEdad.value)
        //Cambiamos el valor de la etiqueta de la edad
        self.labelEdad.text = "\(edadUsuario)"
    }
    
}


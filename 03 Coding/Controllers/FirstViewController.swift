//
//  FirstViewController.swift
//  03 Coding
//
//  Created by antoniogamez on 2/12/18.
//  Copyright © 2018 Adhoc. All rights reserved.
//

import UIKit

// Hemos añadido al firstViewControler el permiso para que los textboxes deleguen funciones al controlador
class FirstViewController: UIViewController, UITextFieldDelegate {
    
    // IB Outlets
    @IBOutlet weak var labelEdad: UILabel! // Etiqueta de Edad
    @IBOutlet weak var sliderEdad: UISlider! // Slider de Edad
    
    // Definimos variables globales
    var edadUsuario : Int = -1  // Edad del usuario
    var nombreUsuario = ""      // Nombre del usuario
    
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
        if let theText = textField.text { // Si el contenido del textField está lleno
            // Imprimimos con consola el texto del textfield
            print(theText)
            // Asignamos el texto del Nombre de Usuario de la texField a la variable nombre de usuario
            self.nombreUsuario = theText
        }
        // Finalizamos la edición del textField
        return true
    }
    
    // Método cambio valor del slider
    @IBAction func sliderEdadMoved(_ sender: UISlider) {
        // Llamamos a la función que actualiza la edad en la etiqueta
        self.actualizarEtiquetaEdad()
    }
    
    // Método validación de datos
    @IBAction func buttonValidar(_ sender: UIButton) {
        // Sólo entran a la fiesta si son Antonio y son mayores de 18 años
        if self.nombreUsuario == "Antonio" && edadUsuario >= 18{
            // Cambiamos el color de fondo a verde
            self.view.backgroundColor = UIColor(red: 49.0/255.0, green: 237.0/255.0, blue: 93.0/255.0, alpha: 0.7)
            
        } else{ // Si no...
                // Cambiamos el color de fondo a rojo
                self.view.backgroundColor = UIColor(red: 250.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 0.8)
        }
    }
    
    // Función que actualiza la etiqueta de la edad
    func actualizarEtiquetaEdad(){
        // Leemos el valor del slider y lo asignamos
        edadUsuario = Int(self.sliderEdad.value)
        //Cambiamos el valor de la etiqueta de la edad
        self.labelEdad.text = "\(edadUsuario)"
    }
    
}


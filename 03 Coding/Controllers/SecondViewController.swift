//
//  SecondViewController.swift
//  03 Coding
//
//  Created by antoniogamez on 2/12/18.
//  Copyright © 2018 Adhoc. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // Definimos las variables
    var fibonacci : [Int] = [0,1]   // Array que contenga la serie de Fibonacci
    var fibId = 1                    // Máximo de elementos de la serie que quiera obtener
    var calculoNumeroOro = false
    
    // Definimos los IBOutlets
    @IBOutlet weak var etiquetaNumero: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var textViewResult: UITextView!
    @IBOutlet weak var etiquetaNumeroOro: UILabel!
    
    // Método de carga del SecondViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Al arrancar el viewController debemos actualizar la etiqueta y generar los números aleatorios
        actualizarEtiqueta(id: Int(self.stepper.value))
    }

    // Función propia que genera los números Fibonacci y los mete en el array hasta el máximo definido en la variable anterior
    func generateFibNumbers() {
        // Aqui generaremos los números hasta el identificador
        fibonacci = [0,1]
        
        for i in 2...fibId { // desde el 2 hasta el fibId (Incluyendo los dos)
            // Calculamos el número nuevo y lo añadimos al array (colección)
            fibonacci.append(fibonacci[i-1]+fibonacci[i-2])
        }
        // Pasamos el array fibonacci a String, de una sóla vez
        let fibStr : [String] = fibonacci.compactMap({String($0)})
        // A la variable result le mandamos el array separadito ya en String
        let result : String = fibStr.joined(separator: "\n")
        // Actualizamos la etiqueta donde vamos a mostrar el resultado
        self.textViewResult.text = result
    }

    func actualizarEtiqueta(id: Int){
        // Asignamos el id que metemos en una variable
        fibId = id
        // Actualizamos la etiqueta
        self.etiquetaNumero.text = "\(self.fibId)"
        // Llamamos a la generación de números
        generateFibNumbers()
        calcularNumeroOro()
    }
    
    // Función que calcula el número de oro
    func calcularNumeroOro() {
        if(calculoNumeroOro){
            // Generamos el número de Oro como cociente entre los dos últimos fibonacci
            let ultimo = Double(fibonacci[fibonacci.count-1])
            let anterior = Double(fibonacci[fibonacci.count-2])
            let numeroOro = ultimo / anterior
            self.etiquetaNumeroOro.text = String(numeroOro)
        }
        else{
            // Ponemos un texto por defecto en la etiqueta
            self.etiquetaNumeroOro.text = "Ver número de oro"
        }
    }
    
    // Métodos y acciones
    // Acción cuando cambia el valor del stepper
    @IBAction func stepperPulsado(_ sender: UIStepper) {
        // Actualizamos las etiquetas
        actualizarEtiqueta(id: Int(sender.value))
    }
    
    // Acción cuando cambie el valor del switch
    @IBAction func switchCambiado(_ sender: UISwitch) {
        calculoNumeroOro = sender.isOn
        calcularNumeroOro()
    }
    
}

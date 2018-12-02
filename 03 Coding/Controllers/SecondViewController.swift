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
    var fibId = 1                   // Máximo de elementos de la serie que quiera obtener
    
    // Método de carga del SecondViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Inicializamos el máximo de números a solicitar
        fibId = 80;
        // Los generamos
        generateFibNumbers()
    }

    // Función propia que genera los números Fibonacci y los mete en el array hasta el máximo definido en la variable anterior
    func generateFibNumbers() {
        if(fibId <= 1 || fibId > 100){ // Si el maximo de números no está entre 1 y 100, entonces no hacemos nada
            return
        }
        
        fibonacci = [0,1]
        // Aqui generaremos los números hasta el identificador
        for i in 2...fibId { // desde el 2 hasta el fibId (Incluyendo los dos)
            // Calculamos el número nuevo y lo añadimos al array (colección)
            fibonacci.append(fibonacci[i-1]+fibonacci[i-2])
            // Lo mostramos por la consola
            print(fibonacci[i])
        }
    }

}


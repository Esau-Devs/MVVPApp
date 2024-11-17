//
//  Calculadora.swift
//  MVVMApp
//
//  Created by MacOsX on 11/17/24.
//

import Foundation

struct Calculator {
func performOperation(_ operation: String, num1: Double, num2: Double) -> Double? {
switch operation {
case "+":
return num1 + num2
case "-":
return num1 - num2
case "*":
return num1 * num2
case "/":
return num2 != 0 ? num1 / num2 : nil // Evitar división por cero
default:
return nil
}
}
}

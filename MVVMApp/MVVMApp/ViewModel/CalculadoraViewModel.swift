//
//  CalculadoraViewModel.swift
//  MVVMApp
//
//  Created by MacOsX on 11/17/24.
//

import Foundation


class CalculatorViewModel {
private let calculator = Calculator()

var result: String = ""
var error: String?

func calculate(operation: String, num1: String, num2: String) {
guard let number1 = Double(num1), let number2 = Double(num2) else {
error = "Por favor, ingresa números válidos."
result = ""
return
}

if let calculationResult = calculator.performOperation(operation, num1: number1, num2: number2) {
result = "\(calculationResult)"
error = nil
} else {
result = ""
error = "Operación inválida (¿División por cero?)."
}
}
}

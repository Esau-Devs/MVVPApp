//
//  CalculadoraView.swift
//  MVVMApp
//
//  Created by MacOsX on 11/17/24.
//

import SwiftUI


struct CalculatorView: View {
@StateObject private var viewModel = CalculatorViewModel()

@State private var num1: String = ""
@State private var num2: String = ""
@State private var operation: String = "+"

var body: some View {
VStack(spacing: 20) {
Text("Calculadora Básica")
.font(.largeTitle)
.padding()

TextField("Número 1", text: $num1)
.textFieldStyle(RoundedBorderTextFieldStyle())
.keyboardType(.decimalPad)
.padding(.horizontal)

TextField("Número 2", text: $num2)
.textFieldStyle(RoundedBorderTextFieldStyle())
.keyboardType(.decimalPad)
.padding(.horizontal)

Picker("Operación", selection: $operation) {
Text("+").tag("+")
Text("-").tag("-")
Text("*").tag("*")
Text("/").tag("/")
}
.pickerStyle(SegmentedPickerStyle())
.padding(.horizontal)

Button(action: {
viewModel.calculate(operation: operation, num1: num1, num2: num2)
}) {
Text("Calcular")
.padding()
.frame(maxWidth: .infinity)
.background(Color.blue)
.foregroundColor(.white)
.cornerRadius(10)
}
.padding(.horizontal)

if let error = viewModel.error {
Text(error)
.foregroundColor(.red)
} else {
Text("Resultado: \(viewModel.result)")
.font(.headline)
}
}
.padding()
}
}


struct CalculadoraView_Previews: PreviewProvider {
    static var previews: some View {
        CalculadoraView()
    }
}

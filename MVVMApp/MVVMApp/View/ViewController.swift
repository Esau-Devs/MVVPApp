//
//  ViewController.swift
//  MVVMApp
//
//  Created by MacOsX on 11/17/24.
//

import UIKit

class ViewController: UIViewController {
private let viewModel = CalculatorViewModel()

// UI Elements
private let num1TextField: UITextField = {
let textField = UITextField()
textField.placeholder = "Número 1"
textField.borderStyle = .roundedRect
textField.keyboardType = .decimalPad
return textField
}()

private let num2TextField: UITextField = {
let textField = UITextField()
textField.placeholder = "Número 2"
textField.borderStyle = .roundedRect
textField.keyboardType = .decimalPad
return textField
}()

private let operationSegmentedControl: UISegmentedControl = {
let segmentedControl = UISegmentedControl(items: ["+", "-", "*", "/"])
segmentedControl.selectedSegmentIndex = 0
return segmentedControl
}()

private let calculateButton: UIButton = {
let button = UIButton(type: .system)
button.setTitle("Calcular", for: .normal)
button.backgroundColor = .systemBlue
button.setTitleColor(.white, for: .normal)
button.layer.cornerRadius = 8
return button
}()

private let resultLabel: UILabel = {
let label = UILabel()
label.text = "Resultado: "
label.font = UIFont.boldSystemFont(ofSize: 18)
label.textAlignment = .center
return label
}()

private let errorLabel: UILabel = {
let label = UILabel()
label.textColor = .red
label.textAlignment = .center
label.numberOfLines = 0
return label
}()

override func viewDidLoad() {
super.viewDidLoad()
view.backgroundColor = .white
setupUI()

calculateButton.addTarget(self, action: #selector(calculateTapped), for: .touchUpInside)
}

private func setupUI() {
let stackView = UIStackView(arrangedSubviews: [num1TextField, num2TextField, operationSegmentedControl, calculateButton, resultLabel, errorLabel])
stackView.axis = .vertical
stackView.spacing = 16
stackView.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(stackView)

NSLayoutConstraint.activate([
stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
])
}

@objc private func calculateTapped() {
let num1 = num1TextField.text ?? ""
let num2 = num2TextField.text ?? ""
let operationIndex = operationSegmentedControl.selectedSegmentIndex
let operation = operationSegmentedControl.titleForSegment(at: operationIndex) ?? "+"

viewModel.calculate(operation: operation, num1: num1, num2: num2)

if let error = viewModel.error {
errorLabel.text = error
resultLabel.text = "Resultado: "
} else {
errorLabel.text = ""
resultLabel.text = "Resultado: \(viewModel.result)"
}
}
}

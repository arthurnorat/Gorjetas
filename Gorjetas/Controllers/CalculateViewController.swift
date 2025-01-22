//
//  CalculateViewController.swift
//  Gorjetas
//
//  Created by Arthur Coelho on 21/08/24.
//

import UIKit

class CalculateViewController: UIViewController {
	
	var tip: Double = 0.10  // Valor padrão da gorjeta (10%)
	var numberOfPeople = 2
	var billTotal = 0.0
	var resultPerPerson = "0.0"
	
	var calculateView: CalculateView?
	
	var valorDaConta: String? { // TODO: MUDAR PARA FLOAT
		return calculateView?.valorDaConta
	}
	
	override func loadView() {
		calculateView = CalculateView()
		view = calculateView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		calculateView?.delegate(delegate: self)
	}
}

extension CalculateViewController: CalculateViewProtocol {
	func tipChanged(sender: UIButton) {
		
		calculateView?.valorDaContaTextField.endEditing(true)
		
		calculateView?.zeroPctButton.isSelected = false
		calculateView?.dezPctButton.isSelected = false
		calculateView?.vintePctButton.isSelected = false
		sender.isSelected = true
		
		if let buttonTitle = sender.currentTitle {
			// Remove o sinal de porcentagem (%)
			let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
					
			// Converte o título para Double
			if let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign) {
				// Calcula a porcentagem da gorjeta
				tip = buttonTitleAsNumber / 100
			}
		}	
	}
	
	func stepperValueChanged(sender: UIStepper) {
		// Atualiza o texto do label com o valor atual do stepper
		calculateView?.quantidadeDePessoasLabel.text = String(format: "%.0f", sender.value)
				
		// Atualiza o número de pessoas com o valor atual do stepper
		numberOfPeople = Int(sender.value)
	}
	
	func tappedCalculateButton() {
		// Obter o valor do campo de texto da conta
		guard let billText = calculateView?.valorDaConta, !billText.isEmpty,
			  let billTotal = Double(billText) else {
			print("Valor da conta inválido")
			return
		}
		
		// Realizar o cálculo
		let result = billTotal * (1 + tip) / Double(numberOfPeople)
		let resultPerPerson = String(format: "%.2f", result)
		
		// Navegar para a próxima tela
		let resultVC = ResultViewController()
		
		// Passar os valores calculados para a próxima tela
		resultVC.totalPerPerson = Float(resultPerPerson) ?? 0.0
		resultVC.numberOfPeople = numberOfPeople
		resultVC.tip = Float(tip)
		
		// Apresenta a próxima tela
		present(resultVC, animated: true)
	}
}


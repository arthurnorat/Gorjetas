//
//  ResultViewController.swift
//  Gorjetas
//
//  Created by Arthur Coelho on 21/08/24.
//

import UIKit

class ResultViewController: UIViewController {
	
	var totalPerPerson: Float = 0.0
	var numberOfPeople: Int = 0
	var tip: Float = 0
	
	var resultView: ResultView?
	
	override func loadView() {
		resultView = ResultView()
		view = resultView
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		resultView?.delegate(delegate: self)
		
		// Atualizar a interface com os valores recebidos
		let totalFormatted = String(format: "R$ %.2f", totalPerPerson)
		resultView?.totalLabel.text = totalFormatted
		resultView?.divisaoLabel.text = "Conta dividida por \(numberOfPeople) pessoas, com \(Int(tip * 100))% de gorjeta."
    }
}

extension ResultViewController: ResultViewProtocol {
	func tappedRecalculateButton() {
		print("RecalculateButton chegou na ResultViewController")
		self.dismiss(animated: true, completion: nil)
	}
}

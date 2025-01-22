//
//  CalculateView.swift
//  Gorjetas
//
//  Created by Arthur Coelho on 21/08/24.
//

import UIKit

protocol CalculateViewProtocol: AnyObject {
	func tipChanged(sender: UIButton)
	func stepperValueChanged(sender: UIStepper)
	func tappedCalculateButton()
}

class CalculateView: UIView {
	
	private weak var delegate: CalculateViewProtocol?
		
	public func delegate(delegate: CalculateViewProtocol?) {
		self.delegate = delegate
	}
	
	public var valorDaConta: String? {
		return valorDaContaTextField.text
	}
	
	lazy var contaStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [valorDaContaLabel, valorDaContaTextField])
		stackView.axis = .vertical
		stackView.spacing = 8
		stackView.backgroundColor = .white
		stackView.alignment = .fill
		stackView.distribution = .fillEqually
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
		
	lazy var valorDaContaLabel: UILabel = {
		let label = UILabel()
		label.text = "Digite o valor da conta"
		label.font = UIFont.systemFont(ofSize: 25)
		label.textColor = .lightGray
		label.textAlignment = .left
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var valorDaContaTextField: UITextField = {
		let textField = UITextField()
		textField.placeholder = "R$ 0,00"
		textField.borderStyle = .roundedRect
		textField.keyboardType = .decimalPad
		textField.textAlignment = .center
		textField.font = UIFont.systemFont(ofSize: 40)
		textField.borderStyle = .none
		textField.textColor = .lightGray
		textField.translatesAutoresizingMaskIntoConstraints = false
		return textField
	}()
	
	lazy var gorjetaStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [selecioneAGorjetaLabel, botoesDaGorjetaStackView, quantasPessoasLabel, pessoasStackView])
		stackView.axis = .vertical
		stackView.spacing = 16
		stackView.alignment = .center
		stackView.distribution = .fill
		stackView.backgroundColor = UIColor(red: 215/255, green: 249/255, blue: 235/255, alpha: 1.0)
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	lazy var selecioneAGorjetaLabel: UILabel = {
		let label = UILabel()
		label.text = "Selecione a gorjeta"
		label.font = UIFont.systemFont(ofSize: 25)
		label.textColor = .lightGray
		label.textAlignment = .left
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var botoesDaGorjetaStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [zeroPctButton, dezPctButton, vintePctButton])
		stackView.axis = .horizontal
		stackView.spacing = 16
		stackView.distribution = .fillEqually
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	lazy var zeroPctButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("0%", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
		button.tintColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1.0)
		button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	lazy var dezPctButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("10%", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
		button.tintColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1.0)
		button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	lazy var vintePctButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("20%", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
		button.tintColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1.0)
		button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	lazy var quantasPessoasLabel: UILabel = {
		let label = UILabel()
		label.text = "Quantas Pessoas?"
		label.font = UIFont.systemFont(ofSize: 25)
		label.textColor = .lightGray
		label.textAlignment = .left
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var pessoasStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [quantidadeDePessoasLabel, quantidadeDePessoasStepper])
		stackView.axis = .horizontal
		stackView.spacing = 27
		stackView.alignment = .center
		stackView.distribution = .fill
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	lazy var quantidadeDePessoasStepper: UIStepper = {
		let stepper = UIStepper()
		stepper.minimumValue = 1
		stepper.value = 1
		stepper.stepValue = 1
		stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
		stepper.translatesAutoresizingMaskIntoConstraints = false
		return stepper
	}()
	
	lazy var quantidadeDePessoasLabel: UILabel = {
		let label = UILabel()
		label.text = "1"
		label.font = UIFont.systemFont(ofSize: 25)
		label.textColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1.0)
		label.textAlignment = .justified
		
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var calcularButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Calcular", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
		button.backgroundColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1.0)
		button.tintColor = .white
		button.layer.cornerRadius = 8
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
		return button
	}()
	
	@objc func tipChanged(_ sender: UIButton) {
		print("Tip alterada")
		delegate?.tipChanged(sender: sender)
	}
	
	@objc func stepperValueChanged(_ sender: UIStepper) {
		delegate?.stepperValueChanged(sender: sender)
	}
	
	@objc func tappedCalculateButton(_ sender: UIButton) {
		print("Botão Calcular pressionado - funcionando na CalculateView")
		delegate?.tappedCalculateButton()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)

		backgroundColor = .white
				
		addElements()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addElements() {
		addSubview(contaStackView)
		addSubview(gorjetaStackView)
		addSubview(calcularButton)
	}
	
	func configConstraints() {
		NSLayoutConstraint.activate([
			// Constraints para contaStackView
			contaStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
			contaStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
			contaStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
			contaStackView.heightAnchor.constraint(equalToConstant: 200),
			
			valorDaContaLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
			valorDaContaLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),

			// Constraints para gorjetaStackView
			gorjetaStackView.topAnchor.constraint(equalTo: contaStackView.bottomAnchor, constant: 0),
			gorjetaStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
			gorjetaStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 30),
			gorjetaStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
			
			selecioneAGorjetaLabel.topAnchor.constraint(equalTo: gorjetaStackView.topAnchor, constant: 20),
			selecioneAGorjetaLabel.leadingAnchor.constraint(equalTo: valorDaContaLabel.leadingAnchor),
			selecioneAGorjetaLabel.trailingAnchor.constraint(equalTo: valorDaContaLabel.trailingAnchor),
			selecioneAGorjetaLabel.heightAnchor.constraint(equalToConstant: 30),
			
			quantasPessoasLabel.heightAnchor.constraint(equalToConstant: 30),
			quantasPessoasLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
			quantasPessoasLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
			
			// TODO: não consigo movimentar esse elemento. Tentei de tudo e desisti
			// pessoasStackView.topAnchor.constraint(equalTo: quantasPessoasLabel.bottomAnchor, constant: 0),
			// pessoasStackView.heightAnchor.constraint(equalToConstant: 54),
			// pessoasStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 10),

			// Constraints para calcularButton
			calcularButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			calcularButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			calcularButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
//			calcularButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}	
}

//
//  ResultView.swift
//  Gorjetas
//
//  Created by Arthur Coelho on 21/08/24.
//

import UIKit

protocol ResultViewProtocol: AnyObject {
	func tappedRecalculateButton()
}

class ResultView: UIView {
	
	private weak var delegate: ResultViewProtocol?
	
	public func delegate(delegate: ResultViewProtocol?) {
		self.delegate = delegate
	}
			
	lazy var resultadoStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [totalPorPessoaLabel, totalLabel])
		stackView.axis = .vertical
		stackView.spacing = 8
		stackView.alignment = .center
		stackView.distribution = .fillEqually
		stackView.backgroundColor = UIColor(red: 215/255, green: 249/255, blue: 235/255, alpha: 1.0)
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	lazy var totalPorPessoaLabel: UILabel = {
		let label = UILabel()
		label.text = "Total por pessoa:"
		label.font = UIFont.systemFont(ofSize: 30)
		label.textColor = .lightGray
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var totalLabel: UILabel = {
		let label = UILabel()
		label.text = "R$ 0,00"
		label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
		label.textColor = .systemGreen
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var divisaoStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: [divisaoLabel])
		stackView.axis = .vertical
		stackView.spacing = 16
		stackView.alignment = .center
		stackView.distribution = .fillEqually
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	lazy var divisaoLabel: UILabel = {
		let label = UILabel()
		label.text = "Divisão"
		label.font = UIFont.systemFont(ofSize: 25)
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.textColor = .gray
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var recalculateButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Recalcular", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
		button.backgroundColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1.0)
		button.tintColor = .white
		button.layer.cornerRadius = 8
		button.addTarget(self, action: #selector(tappedRecalculateButton), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	@objc func tappedRecalculateButton(_ sender: UIButton) {
		print("Recalculate button funcionando na ResultView")
		delegate?.tappedRecalculateButton()
	}
		
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.backgroundColor = .white
				
		addElements()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addElements() {
		addSubview(resultadoStackView)
		addSubview(divisaoStackView)
		addSubview(recalculateButton)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			// Constraints para resultadoStackView
			resultadoStackView.heightAnchor.constraint(equalToConstant: 300),
			resultadoStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0),
			resultadoStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
							
			// Constraints para divisaoLabel
			divisaoLabel.topAnchor.constraint(equalTo: resultadoStackView.bottomAnchor, constant: 20),
			divisaoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), // Limite à esquerda
			divisaoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20), // Limite à direita
			divisaoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
				
			// Constraints para recalculateButton
			recalculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			recalculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			recalculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
			recalculateButton.heightAnchor.constraint(equalToConstant: 50),
		])
	}
}

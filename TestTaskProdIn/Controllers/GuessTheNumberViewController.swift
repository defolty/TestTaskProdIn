//
//  GuessTheNumberViewController.swift
//  TestTaskProdIn
//
//  Created by Nikita Nesporov on 14.08.2022.
//
 
import UIKit

extension GuessTheNumberViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //Constraints to RoundLabel
            roundLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            roundLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //Constraints to NumberTextField
            numberTextField.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 50),
            numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //Constraints to EnterNumberButton
            enterNumberButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            enterNumberButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterNumberButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            enterNumberButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

class GuessTheNumberViewController: UIViewController {
     
    var guessingNumber: String = "0"
    var numbersModel = NumbersModel(
        computersNumber: 0,
        myNumber: 0,
        myNumberEnterred: 0,
        computerNumberEnterred: 0
    )
     
    private let roundLabel = MainLabel()
    private let numberTextField = NumberTextField()
    private let enterNumberButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        setConstraints()
        
        //на шаблоне нет кнопки Back, если надо скрыть, то можно раскомментировать строчку ниже
        //navigationItem.hidesBackButton = true
    }
    
    private func setupViews() {
        roundLabel.text = "Round №"
        enterNumberButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        numberTextField.addTarget(self, action: #selector(didChangeText), for: .editingChanged)
        view.addSubview(roundLabel)
        view.addSubview(numberTextField)
        view.addSubview(enterNumberButton)
        enterNumberButton.isEnabled = false
        enterNumberButton.backgroundColor = UIColor(red:0.50, green:0.50, blue:0.97, alpha:1.0)
    }
    
    @objc func didChangeText() {
        if let number = numberTextField.text?.count {
            if number > 0 {
                enterNumberButton.backgroundColor = .systemBlue
                enterNumberButton.isEnabled = true
            } else {
                enterNumberButton.backgroundColor = UIColor(red:0.50, green:0.50, blue:0.97, alpha:1.0)
                enterNumberButton.isEnabled = false
            }
        }
    }
    
    @objc func enterButtonTapped() {
        if let text = numberTextField.text {
            guard let number = Int(text.filter { $0.isWholeNumber }) else { return }
            print(number)
             
            let computersResultVC = ComputersResultViewController()
            computersResultVC.guessedNumber = number
            self.present(computersResultVC, animated: true, completion: nil)
        }
    }
}


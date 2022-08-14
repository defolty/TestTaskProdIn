//
//  PlayersResultViewController.swift
//  TestTaskProdIn
//
//  Created by Nikita Nesporov on 14.08.2022.
//

import UIKit

class GamersResultViewController: UIViewController {
    
    private let gamersResultTextField = NumberTextField()
    private let enterNumberButton = CustomButton()
    private let roundLabel = MainLabel()
    private let whoseGuessesLabel = MainLabel()
    private let resultLabel = MainLabel()
    
    var counter = 0
    var compCounter = 0
    var guessedNumber = Int.random(in: 1...100)
    var myNumber = 0
 
    var numberModel = NumbersModel(
        computersNumber: 0,
        myNumber: 0,
        myNumberEnterred: 0,
        computerNumberEnterred: 0
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        print(guessedNumber)
        view.backgroundColor = .white
    }
     
    private func setupViews() {
        enterNumberButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        gamersResultTextField.addTarget(self, action: #selector(didChangeText), for: .editingChanged)
        view.addSubview(gamersResultTextField)
        view.addSubview(enterNumberButton)
        view.addSubview(roundLabel)
        roundLabel.text = "Round № \(counter)"
        whoseGuessesLabel.text = "You are guessing"
        view.addSubview(whoseGuessesLabel)
        view.addSubview(resultLabel)
        enterNumberButton.isEnabled = false
        enterNumberButton.backgroundColor = UIColor(red:0.50, green:0.50, blue:0.97, alpha:1.0)
    }
    
    @objc private func didChangeText() {
        if let number = gamersResultTextField.text?.count {
            if number > 0 {
                enterNumberButton.backgroundColor = .systemBlue
                enterNumberButton.isEnabled = true
            } else {
                enterNumberButton.backgroundColor = UIColor(red:0.50, green:0.50, blue:0.97, alpha:1.0)
                enterNumberButton.isEnabled = false
            }
        }
    }
    

    private func checkResult(myNumber: Int) {
        if myNumber == guessedNumber {
            print("GoNextVC")
            resultLabel.isHidden = true
            counter += 1
            
            let resultsVC = ResultsViewController()
            resultsVC.myCounter = counter
             
            resultsVC.compCounter = compCounter
            
            show(resultsVC, sender: nil)
            
        } else if myNumber > guessedNumber {
            resultLabel.text = "No, my number is less than you"
        } else if myNumber < guessedNumber {
            resultLabel.text = "No, my number is more than you"
        }
    }
    
    @objc private func enterButtonTapped() {
        if let text = gamersResultTextField.text {
            guard let number = Int(text.filter { $0.isWholeNumber }) else { return }
            print(number)
            checkResult(myNumber: number)
            counter += 1
            roundLabel.text = "Round № \(counter)"
            
            
        }
    }
}

extension GamersResultViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            roundLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            roundLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            whoseGuessesLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 10),
            whoseGuessesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gamersResultTextField.topAnchor.constraint(equalTo: whoseGuessesLabel.bottomAnchor, constant: 80),
            gamersResultTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            gamersResultTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            enterNumberButton.topAnchor.constraint(equalTo: gamersResultTextField.bottomAnchor, constant: 80),
            enterNumberButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            enterNumberButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultLabel.topAnchor.constraint(equalTo: enterNumberButton.bottomAnchor, constant: 80),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

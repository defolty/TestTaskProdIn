//
//  ResultsViewController.swift
//  TestTaskProdIn
//
//  Created by Nikita Nesporov on 14.08.2022.
//

import UIKit
 
class ResultsViewController: UIViewController {
     
    private let scoresLabel = MainLabel()
    private let myTrieslabel = MainLabel()
    private let compTriesLabel = MainLabel()
    private let whoWinLabel = MainLabel()
    private let mainMenuButton = CustomButton()
    
    var myCounter = 1
    var compCounter = 5
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(scoresLabel)
        scoresLabel.text = "Scores:"
        view.addSubview(myTrieslabel)
        myTrieslabel.text = "Your's tries count: \(myCounter)"
        view.addSubview(compTriesLabel)
        compTriesLabel.text = "Computer's tries count: \(compCounter)"
        view.addSubview(whoWinLabel)
        calculateWhoWin()
        view.addSubview(mainMenuButton)
        mainMenuButton.setTitle("Main menu", for: .normal)
        mainMenuButton.addTarget(self, action: #selector(mainMenuButtonTapped), for: .touchUpInside)
    }
    
    private func calculateWhoWin() {
        if myCounter > compCounter {
            whoWinLabel.text = "Computer win"
        } else if myCounter < compCounter {
            whoWinLabel.text = "You win"
        } else {
            whoWinLabel.text = "It's draw"
        }
    }
    
    @objc private func mainMenuButtonTapped() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}

extension ResultsViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            scoresLabel.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            scoresLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //
            myTrieslabel.topAnchor.constraint(equalTo: scoresLabel.bottomAnchor, constant: 120),
            myTrieslabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //
            compTriesLabel.topAnchor.constraint(equalTo: myTrieslabel.bottomAnchor, constant: 15),
            compTriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //
            mainMenuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            mainMenuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainMenuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //
            whoWinLabel.bottomAnchor.constraint(equalTo: mainMenuButton.topAnchor, constant: -60),
            whoWinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

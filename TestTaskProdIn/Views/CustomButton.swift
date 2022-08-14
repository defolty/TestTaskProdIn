//
//  CustomButton.swift
//  TestTaskProdIn
//
//  Created by Nikita Nesporov on 14.08.2022.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitle("Enter the number", for: .normal)
        backgroundColor = .systemBlue
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel?.numberOfLines = 1
        layer.cornerRadius = 10 
        titleEdgeInsets = UIEdgeInsets(
            top: 5,
            left: 10,
            bottom: 5,
            right: 10
        )
        translatesAutoresizingMaskIntoConstraints = false
    }
}

//
//  MainLabel.swift
//  TestTaskProdIn
//
//  Created by Nikita Nesporov on 14.08.2022.
//

import UIKit

class MainLabel: UILabel {
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .black
        font = UIFont.boldSystemFont(ofSize: 17)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}

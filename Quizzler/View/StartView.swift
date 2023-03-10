//
//  StartView.swift
//  Quizzler
//
//  Created by Yevhenii Vladichuk on 31/01/2023.
//

import Foundation
import UIKit

class StartView: AppUI {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewsWithConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviewsWithConstraints()
    }
    
    func addSubviewsWithConstraints() {
        
        questionLabel.text = "Choose your quiz 🥸"
        firstButton.setTitle("Math", for: .normal)
        secondButton.setTitle("History", for: .normal)
        
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(questionLabel)
        verticalStackView.addArrangedSubview(firstButton)
        verticalStackView.addArrangedSubview(secondButton)
        
        NSLayoutConstraint.activate([
            verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            questionLabel.heightAnchor.constraint(equalToConstant: 120),
            questionLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            
            firstButton.heightAnchor.constraint(equalToConstant: 80),
            firstButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            firstButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            
            secondButton.heightAnchor.constraint(equalToConstant: 80),
            secondButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            secondButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
        ])
    }
}


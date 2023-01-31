//
//  StartView.swift
//  Quizzler
//
//  Created by Yevhenii Vladichuk on 31/01/2023.
//

import Foundation
import UIKit

class StartView: UserInterface {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewsWithConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviewsWithConstraints()
    }
    
    override func addSubviewsWithConstraints() {
        addSubview(verticalStackView)
        addSubview(backGroundImage)
        verticalStackView.addArrangedSubview(questionLabel)
        questionLabel.text = "Choose your quiz"
        trueButton.setTitle("History", for: .normal)
        falseButton.setTitle("Math", for: .normal)
        verticalStackView.addArrangedSubview(trueButton)
        verticalStackView.addArrangedSubview(falseButton)
        
        NSLayoutConstraint.activate([
            verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            questionLabel.heightAnchor.constraint(equalToConstant: 120),
            questionLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),

            trueButton.heightAnchor.constraint(equalToConstant: 80),
            trueButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            trueButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            
            falseButton.heightAnchor.constraint(equalToConstant: 80),
            falseButton.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            falseButton.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            
            
            backGroundImage.heightAnchor.constraint(equalToConstant: 127),
            backGroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backGroundImage.widthAnchor.constraint(equalTo: widthAnchor),
        ])
    }
}


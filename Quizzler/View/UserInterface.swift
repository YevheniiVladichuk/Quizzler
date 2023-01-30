//
//  UserInterface.swift
//  Quizzler
//
//  Created by Yevhenii Vladichuk on 28/01/2023.
//

import Foundation
import UIKit

class UserInterface: UIView {
    
    var quizHead = QuizHead()
    
    let verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillProportionally
        verticalStackView.spacing = 10
        verticalStackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        verticalStackView.isLayoutMarginsRelativeArrangement = true
        verticalStackView.backgroundColor = .clear
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()
    
    let scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.textColor = .white
        scoreLabel.font = UIFont(name: "American Typewriter", size: 17)
        scoreLabel.baselineAdjustment = .alignBaselines
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        return scoreLabel
    }()
    
    let questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.textColor = .white
        questionLabel.font = UIFont(name: "American Typewriter", size: 30)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionLabel
    }()
    
    let trueButton: UIButton = {
        let trueButton = UIButton()
        trueButton.backgroundColor = UIColor.clear
        trueButton.setTitle("True", for: .normal)
        trueButton.titleLabel?.font = trueButton.titleLabel?.font.withSize(28)
        trueButton.layer.cornerRadius = 15
        trueButton.layer.borderWidth = 2
        trueButton.layer.borderColor = #colorLiteral(red: 0.2752144039, green: 0.3882935941, blue: 0.5629131198, alpha: 1)
        trueButton.translatesAutoresizingMaskIntoConstraints = false
        return trueButton
    }()
    
    let falseButton: UIButton = {
        let falseButton = UIButton()
        falseButton.backgroundColor = UIColor.clear
        falseButton.setTitle("False", for: .normal)
        falseButton.titleLabel?.font = falseButton.titleLabel?.font.withSize(28)
        falseButton.layer.cornerRadius = 15
        falseButton.layer.borderWidth = 2
        falseButton.layer.borderColor = #colorLiteral(red: 0.2752144039, green: 0.3882935941, blue: 0.5629131198, alpha: 1)
        falseButton.translatesAutoresizingMaskIntoConstraints = false
        return falseButton
    }()
    
    let backGroundImage: UIImageView = {
        let backGroundImage = UIImageView()
        backGroundImage.image = UIImage(named: "Background-Bubbles")
        backGroundImage.contentMode = .scaleAspectFill
        backGroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backGroundImage
    }()
    
    let progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.trackTintColor = .white
        progressBar.tintColor = UIColor(red: 253/255.0, green: 116/255.0, blue: 167/255.0, alpha: 1)
        progressBar.clipsToBounds = true
        progressBar.layer.cornerRadius = 5
        progressBar.layer.borderWidth = 1
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviewsWithConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviewsWithConstraints()
    }
    
    
    func addSubviewsWithConstraints() {
        
        addSubview(backGroundImage)
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(scoreLabel)
        verticalStackView.addArrangedSubview(questionLabel)
        verticalStackView.addArrangedSubview(trueButton)
        verticalStackView.addArrangedSubview(falseButton)
        verticalStackView.addArrangedSubview(progressBar)
        // constaraints
        NSLayoutConstraint.activate([
            
            verticalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            scoreLabel.topAnchor.constraint(equalTo: verticalStackView.topAnchor, constant: 0),
            scoreLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            scoreLabel.heightAnchor.constraint(equalToConstant: 20),
            
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
            
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            progressBar.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
        ])
    }
}

//
//  AppUI.swift
//  Quizzler
//
//  Created by Yevhenii Vladichuk on 31/01/2023.
//

import Foundation
import UIKit

class AppUI: UIView {
    
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
        scoreLabel.text = "Score: "
        scoreLabel.font = UIFont(name: "American Typewriter", size: 17)
        scoreLabel.baselineAdjustment = .alignBaselines
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        return scoreLabel
    }()
    
    let questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.textColor = .white
        questionLabel.text = "Default text"
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0
        questionLabel.font = UIFont(name: "American Typewriter", size: 30)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        return questionLabel
    }()
    
    let firstButton: UIButton = {
        let firstButton = UIButton()
        firstButton.backgroundColor = UIColor.clear
        firstButton.setTitle("First Button", for: .normal)
        firstButton.titleLabel?.font = UIFont(name: "American Typewriter", size: 22)
        firstButton.layer.cornerRadius = 15
        firstButton.layer.borderWidth = 2
        firstButton.layer.borderColor = #colorLiteral(red: 0.2752144039, green: 0.3882935941, blue: 0.5629131198, alpha: 1)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        return firstButton
    }()
    
    let secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.backgroundColor = UIColor.clear
        secondButton.setTitle("Second Button", for: .normal)
        secondButton.titleLabel?.font = UIFont(name: "American Typewriter", size: 22)
        secondButton.layer.cornerRadius = 15
        secondButton.layer.borderWidth = 2
        secondButton.layer.borderColor = #colorLiteral(red: 0.2752144039, green: 0.3882935941, blue: 0.5629131198, alpha: 1)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        return secondButton
    }()
    
    let thirdButton: UIButton = {
        let thirdButton = UIButton()
        thirdButton.backgroundColor = UIColor.clear
        thirdButton.setTitle("Third Button", for: .normal)
        thirdButton.titleLabel?.font = UIFont(name: "American Typewriter", size: 22)
        thirdButton.layer.cornerRadius = 15
        thirdButton.layer.borderWidth = 2
        thirdButton.layer.borderColor = #colorLiteral(red: 0.2752144039, green: 0.3882935941, blue: 0.5629131198, alpha: 1)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        return thirdButton
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
        addBackgroundImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addBackgroundImage()
    }
    
    func addBackgroundImage() {
        // view background color
        backgroundColor = UIColor(red: 49/255, green: 59/255, blue: 93/255, alpha: 1)
        
        addSubview(backGroundImage)
        NSLayoutConstraint.activate([
            backGroundImage.heightAnchor.constraint(equalToConstant: 127),
            backGroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backGroundImage.widthAnchor.constraint(equalTo: widthAnchor),
        ])
    }
}

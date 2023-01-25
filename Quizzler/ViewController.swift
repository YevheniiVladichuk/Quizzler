//
//  ViewController.swift
//  Quizzler
//
//  Created by Yevhenii Vladichuk on 25/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let backGroundImage: UIImageView = {
        let backGroundImage = UIImageView()
        backGroundImage.image = UIImage(named: "Background-Bubbles")
        backGroundImage.contentMode = .scaleAspectFill
        return backGroundImage
    }()
    
    let verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillProportionally
        
        return verticalStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackgroundImage()
    }
    
    func configBackgroundImage() {
        view.addSubview(backGroundImage)
        
        backGroundImage.translatesAutoresizingMaskIntoConstraints = false
        backGroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        backGroundImage.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
        backGroundImage.heightAnchor.constraint(equalToConstant: 102).isActive = true
    }
    
    
}


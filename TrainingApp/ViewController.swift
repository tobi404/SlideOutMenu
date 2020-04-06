//
//  ViewController.swift
//  TrainingApp
//
//  Created by Beka Demuradze on 2/17/20.
//  Copyright © 2020 Beka Demuradze. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Properties
    let buttons: [menuButton] = [
        menuButton(name: "Home", iconName: "house"),
        menuButton(name: "My profile", iconName: "person.circle"),
        menuButton(name: "Website", iconName: "safari"),
        menuButton(name: "World Tour", iconName: "globe"),
        menuButton(name: "Suggested", iconName: "mappin.circle"),
        menuButton(name: "Library", iconName: "gamecontroller"),
        menuButton(name: "Contacts", iconName: "rectangle.stack.person.crop")
    ]
    
    //BaclView UI Elements
    
    let exitButton: UIButton = {
        let button = UIButton(type: .system)
        let buttonImage = UIImage(systemName: "xmark")
        button.setImage(buttonImage, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.tintColor = #colorLiteral(red: 0.1876248121, green: 0.4323936105, blue: 0.991342485, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let imageView: UIImageView = {
        let avatarImage = UIImage(named: "Avatar")
        let iv = UIImageView(image: avatarImage)
        iv.layer.cornerRadius = 20
        iv.layer.masksToBounds = true
        iv.heightAnchor.constraint(equalToConstant: 100).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 100).isActive = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.text = "Beka\nDemuradze"
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .leading
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let bottomButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Book Schedule", for: .normal)
        bt.setTitleColor(#colorLiteral(red: 0.1876248121, green: 0.4323936105, blue: 0.991342485, alpha: 1), for: .normal)
        bt.backgroundColor = .white
        bt.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bt.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bt.layer.cornerRadius = 20
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    //FrontViewUIElements
    
    let frontView: UIView = {
        let fv = UIView()
        fv.backgroundColor = .white
        fv.layer.shadowOffset = .init(width: 15, height: 15)
        fv.layer.shadowRadius = 20
        fv.layer.shadowColor = .some(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        fv.layer.shadowOpacity = 0.8
        fv.translatesAutoresizingMaskIntoConstraints = false
        return fv
    }()
    
    let showMenuButton: UIButton = {
        let smb = UIButton(type: .system)
        let image = UIImage(systemName: "equal")
        smb.setImage(image, for: .normal)
        smb.backgroundColor = #colorLiteral(red: 0.1876248121, green: 0.4323936105, blue: 0.991342485, alpha: 1)
        smb.tintColor = .white
        smb.heightAnchor.constraint(equalToConstant: 50).isActive = true
        smb.widthAnchor.constraint(equalToConstant: 50).isActive = true
        smb.layer.cornerRadius = 20
        smb.translatesAutoresizingMaskIntoConstraints = false
        return smb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        setupBackLayout()
        setupFrontView()
    }
    
    
    @objc fileprivate func showMenu() {
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            let threeD = CATransform3DMakeRotation(-0.5, 0, 1, 0.6)
            self.frontView.transform3D = CATransform3DTranslate(threeD, 300, 200, 0)
            self.showMenuButton.alpha = 0
        })
        
    }
    
    fileprivate func setupBackLayout() {
        view.backgroundColor = #colorLiteral(red: 0.1876248121, green: 0.4323936105, blue: 0.991342485, alpha: 1)
        view.addSubview(imageView)
        view.addSubview(exitButton)
        view.addSubview(name)
        view.addSubview(stackView)
        view.addSubview(bottomButton)
        
        imageView.insetsLayoutMarginsFromSafeArea = true
        
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            exitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            imageView.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 40),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.heightAnchor.constraint(equalToConstant: 300),
            stackView.widthAnchor.constraint(equalToConstant: 300),
            
            bottomButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
        ])
        
        exitButton.addTarget(self, action: #selector(closeMenu), for: .touchUpInside)
    }
    
    fileprivate func setupFrontView(){
        view.addSubview(frontView)
        frontView.layer.cornerRadius = 40
        frontView.translatesAutoresizingMaskIntoConstraints = false
        frontView.addSubview(showMenuButton)
        
        NSLayoutConstraint.activate([
            frontView.topAnchor.constraint(equalTo: view.topAnchor),
            frontView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frontView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frontView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            showMenuButton.topAnchor.constraint(equalTo: frontView.topAnchor, constant: 70),
            showMenuButton.leadingAnchor.constraint(equalTo: frontView.leadingAnchor, constant: 20),
        ])
        
        showMenuButton.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
    }
    
    @objc fileprivate func closeMenu() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            self.frontView.transform = .identity
            self.showMenuButton.alpha = 1
        })
    }
    
    fileprivate func setupButtons() {
        let subviews = buttons.map { (bt) -> UIView in
            let button = UIButton(type: .system)
            let image = UIImage(systemName: bt.iconName!)
            button.setImage(image, for: .normal)
            button.setTitle(bt.name, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
            button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
            button.titleEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 0)
            button.tintColor = .white
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            button.widthAnchor.constraint(equalToConstant: 170).isActive = true
            return button
        }
        
        subviews.forEach { (v) in
            self.stackView.addArrangedSubview(v)
        }
    }
    
    
}



//
//  MainController+UI.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit

extension MainController {
    func setupSubviews() {
        view.addSubview(plusButton)
        
        let saveItemImage = UIBarButtonItem(image: UIImage(systemName: Constants.Images.arrowDown), style: .plain, target: self, action: #selector(saveTapped))
        let saveItemTitle = UIBarButtonItem(title: Constants.Other.save, style: .plain, target: self, action: #selector(saveTapped))
        
        navigationItem.rightBarButtonItems = [saveItemTitle, saveItemImage]
        
        plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        plusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func configureUI() {
        view.backgroundColor = .white
    }
    
    func hidePlusButton() {
        plusButton.isHidden = true
    }
    
    func addImageView(with image: UIImage) {
        plusButton.removeFromSuperview()
        view.addSubview(scrollView)
        scrollView.addSubview(fullImageView)
        scrollView.addSubview(cropView)
        
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        fullImageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        fullImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        fullImageView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        fullImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        fullImageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        fullImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        fullImageView.image = image
        
        cropView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        cropView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        cropView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cropView.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}

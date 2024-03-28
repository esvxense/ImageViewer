//
//  SettingsControllerButtonTableViewCell.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit

protocol SettingsControllerButtonTableViewCellProtocol {
    func configure(model: String)
    var showAbout: (() -> Void)? { get set }
}

class SettingsControllerButtonTableViewCell: UITableViewCell {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(aboutTapped), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    var showAbout: (() -> Void)?
    
    private func setup() {
        contentView.addSubview(button)
        button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc private func aboutTapped() {
        showAbout?()
    }
}

extension SettingsControllerButtonTableViewCell: SettingsControllerButtonTableViewCellProtocol {
    func configure(model: String) {
        setup()
        button.setTitle(model, for: .normal)
    }
}

//
//  SettingsControllerTableConfigurators.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit

protocol SettingsControllerButtonConfiguratorProtocol: BaseConfigurator {
    var type: SettingsType? { get set }
}

final class SettingsControllerButtonConfigurator: SettingsControllerButtonConfiguratorProtocol {
    var reuseId: String { String(describing: SettingsControllerButtonTableViewCell.self) }
    var model: String?
    var type: SettingsType?
    var showAbout: (() -> Void)?
    
    func setup(cell: UIView) {
        guard var cell = cell as? SettingsControllerButtonTableViewCellProtocol,
              let model else {
            return
        }
        cell.showAbout = { [weak self] in
            self?.showAbout?()
        }
        cell.configure(model: model)
    }
}

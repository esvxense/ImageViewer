//
//  SettingsViewModel.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit.UITableView

final class SettingsViewModel {
    
    private let coordinator: SettingsCoordinator
    private var tableManager: SettingsControllerTableManagerProtocol
    
    init(coordinator: SettingsCoordinator, tableManager: SettingsControllerTableManagerProtocol) {
        self.coordinator = coordinator
        self.tableManager = tableManager
    }
    
    func attachTableView(_ tableView: UITableView) {
        tableManager.attach(tableView)
        tableManager.setDataToTable(buttonTitle: Constants.Other.about)
        bindManagerClosures()
    }
    
    private func bindManagerClosures() {
        tableManager.aboutTapped = { [weak self] in
            self?.coordinator.openAboutAlert()
        }
    }
}

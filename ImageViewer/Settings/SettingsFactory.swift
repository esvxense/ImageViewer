//
//  SettingsFactory.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import Foundation

enum SettingsFactory {
    static func createSettingsController() -> SettingsController {
        let coordinator = SettingsCoordinator()
        let viewModel = SettingsViewModel(coordinator: coordinator, tableManager: SettingsControllerTableManager())
        let controller = SettingsController(viewModel: viewModel)
        coordinator.router = controller
        
        return controller
    }
}

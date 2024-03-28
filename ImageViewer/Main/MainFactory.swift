//
//  MainFactory.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

enum MainFactory {
    static func createMainController() -> MainController {
        let coordinator = MainCoordinator()
        let viewModel = MainViewModel(coordinator: coordinator)
        let controller = MainController(viewModel: viewModel)
        coordinator.router = controller
        
        return controller
    }
}

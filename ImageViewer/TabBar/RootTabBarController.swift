//
//  TabBarController.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 27.03.24.
//

import UIKit

enum RootTabBarControllerTab: Int {
    case main
    case settings
    
    var image: UIImage? {
        switch self {
        case .main:
            return UIImage(systemName: Constants.Images.home)
        case .settings:
            return UIImage(systemName: Constants.Images.gearshape)
        }
    }
}

final class RootTabBarController: UITabBarController {
    private var currentSelectedItemIndex = 0
    private(set) var navigationControllers: [UINavigationController] = []
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
//        bindViewModel()
    }

    private func setupTabBar() {
        let mainController = MainFactory.createMainController()
        mainController.tabBarItem.image = RootTabBarControllerTab.main.image
        
        let settingsController = SettingsFactory.createSettingsController()
        settingsController.tabBarItem.image = RootTabBarControllerTab.settings.image

        navigationControllers = [
            UINavigationController(rootViewController: mainController),
            UINavigationController(rootViewController: settingsController)
        ]
        viewControllers = navigationControllers
    }
}


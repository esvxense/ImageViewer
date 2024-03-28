//
//  SettingsCoordinator.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit

final class SettingsCoordinator {
    weak var router: (NavigationRouter & PresentationRouter)?
    
    func openAboutAlert() {
        let aboutAlert = UIAlertController(
            title: Constants.Other.developer,
            message: Constants.Other.developerName,
            preferredStyle: UIAlertController.Style.alert
        )
        aboutAlert.addAction(
            UIAlertAction(
                title: Constants.Other.ok,
                style: .cancel
            )
        )
        router?.present(controller: aboutAlert, isAnimated: true, completion: nil)
    }
}

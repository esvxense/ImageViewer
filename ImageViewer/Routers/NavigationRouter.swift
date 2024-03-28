//
//  NavigationRouter.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit

protocol NavigationRouter: AnyObject {
    func push(controller: UIViewController, isAnimated: Bool)
    func pop(isAnimated: Bool)
    func popToRoot(isAnimated: Bool)
}

extension UIViewController: NavigationRouter {
    func push(controller: UIViewController, isAnimated: Bool = true) {
        navigationController?.pushViewController(controller, animated: isAnimated)
    }
    
    func pop(isAnimated: Bool = true) {
        navigationController?.popViewController(animated: isAnimated)
    }

    func popToRoot(isAnimated: Bool) {
        navigationController?.popToRootViewController(animated: isAnimated)
    }
}

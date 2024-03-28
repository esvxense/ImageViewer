//
//  PresentationRouter.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit

protocol PresentationRouter: AnyObject {
    func present(controller: UIViewController, isAnimated: Bool, completion: (() -> Void)?)
    func dismiss(isAnimated: Bool, completion: (() -> Void)?)
}

extension UIViewController: PresentationRouter {
    func present(controller: UIViewController, isAnimated: Bool = true, completion: (() -> Void)? = nil) {
        present(controller, animated: isAnimated, completion: completion)
    }
    
    func dismiss(isAnimated: Bool = true, completion: (() -> Void)? = nil) {
        dismiss(animated: isAnimated, completion: completion)
    }
}

//
//  UITableView+Extensions.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit.UITableView

extension UITableView {
    func registerNib(with className: AnyClass) {
        let name = String(describing: className)
        let nib = UINib(nibName: name, bundle: nil)
        register(nib, forCellReuseIdentifier: name)
    }
    
    func registerCell(with className: AnyClass) {
        let name = String(describing: className)
        register(className, forCellReuseIdentifier: name)
    }
    
    func registerCell<T>(_: T.Type) {
        register(UINib(nibName: String(describing: T.self), bundle: nil), forCellReuseIdentifier: String(describing: T.self))
    }
}

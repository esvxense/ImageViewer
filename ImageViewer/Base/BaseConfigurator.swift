//
//  BaseConfigurator.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit.UIView

protocol BaseConfigurator {
    var reuseId: String { get }
    func setup(cell: UIView)
}

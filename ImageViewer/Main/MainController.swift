//
//  MainController.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit

final class MainController: UIViewController {
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.Images.plus), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 100), forImageIn: .normal)
        button.addTarget(self, action: #selector(addImageTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 2
        return scrollView
    }()
    
    lazy var fullImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var cropView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.yellow.cgColor
        return view
    }()
        
    private let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureUI()
    }
    
    @objc private func addImageTapped() {
        viewModel.showImagePicker { [weak self] image in
            guard let self else { return }
            self.addImageView(with: image)
        }
    }
    
    @objc func saveTapped() {
        viewModel.performCroppingImage(for: fullImageView, with: cropView)
    }
}

extension MainController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        fullImageView
    }
}

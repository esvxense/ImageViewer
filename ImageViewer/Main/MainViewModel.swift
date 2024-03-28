//
//  MainViewModel.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit

final class MainViewModel {

    let coordinator: MainCoordinator
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func showImagePicker(completion: ((UIImage) -> Void)?) {
        coordinator.showImagePicker(completion: completion)
    }
    
    func performCroppingImage(for imageView: UIImageView, with cropView: UIView) {
        guard let cropImage = imageView.image else { return }
        let cropRect = CGRect(
            x: cropView.frame.origin.x - imageView.realImageRect().origin.x,
            y: cropView.frame.origin.y - imageView.realImageRect().origin.y,
            width: cropView.frame.width,
            height: cropView.frame.height
        )
        
        let croppedImage = ImagePerformer.shared.cropImage(
            cropImage,
            zone: cropRect,
            width: imageView.frame.width,
            height: imageView.frame.height
        ) ?? UIImage()
        
        savePerformedImage(image: croppedImage)
    }
    
    func savePerformedImage(image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
                return
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
                return
        }
        print(directory)
        if let _ = try? data.write(to: directory.appendingPathComponent(Constants.Images.savingName)!) {
            coordinator.showAlert(isError: false)
        } else {
            coordinator.showAlert(isError: true)
        }
    }
}

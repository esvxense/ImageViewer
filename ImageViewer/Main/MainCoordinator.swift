//
//  MainCoordinator.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit

final class MainCoordinator: NSObject {
    weak var router: (NavigationRouter & PresentationRouter)?
    
    private var imagePickerCompletion: ((UIImage) -> Void)?
    
    func showImagePicker(completion: ((UIImage) -> Void)?) {
        imagePickerCompletion = completion
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .savedPhotosAlbum
            imagePickerController.allowsEditing = false
            router?.present(controller: imagePickerController, isAnimated: true, completion: nil)
        }
    }
    
    func showAlert(isError: Bool) {
        let alert = UIAlertController(title: isError ? Constants.Other.error : Constants.Other.success, message: Constants.Other.developerName, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.Other.ok, style: .cancel))
        router?.present(controller: alert, isAnimated: true, completion: nil)
    }
}

extension MainCoordinator: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        router?.dismiss(isAnimated: true, completion: { [weak self] in
            self?.imagePickerCompletion?(chosenImage)
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        router?.dismiss(isAnimated: true, completion: nil)
    }
}

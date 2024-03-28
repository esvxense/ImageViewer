//
//  UIImageView+Extensions.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit

extension UIImageView {
    func realImageRect() -> CGRect {
        let imageViewSize = self.frame.size
        
        guard let imageSize = self.image?.size else {
            return CGRect.zero
        }
        
        let scaleWidth = imageViewSize.width / imageSize.width
        let scaleHeight = imageViewSize.height / imageSize.height
        let aspect = fmin(scaleWidth, scaleHeight)
        
        var imageRect = CGRect(
            x: 0,
            y: 0,
            width: imageSize.width * aspect,
            height: imageSize.height * aspect
        )
        
        imageRect.origin.x = (imageViewSize.width - imageRect.size.width) / 2
        imageRect.origin.y = (imageViewSize.height - imageRect.size.height) / 2
        imageRect.origin.x += self.frame.origin.x
        imageRect.origin.y += self.frame.origin.y
        
        return imageRect
    }
}

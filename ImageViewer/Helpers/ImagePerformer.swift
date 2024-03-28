//
//  ImagePerformer.swift
//  ImageViewer
//
//  Created by Alexander Snitko on 28.03.24.
//

import UIKit

struct ImagePerformer {
    static let shared = ImagePerformer()
    private init() {}
    
    func cropImage(_ image: UIImage, zone: CGRect, width: CGFloat, height: CGFloat) -> UIImage? {
        let scale = max(
            image.size.width / width,
            image.size.height / height
        )
        let cropZone = CGRect(
            x: zone.origin.x * scale,
            y: zone.origin.y * scale,
            width: zone.size.width * scale,
            height: zone.size.height * scale)
        
        guard let cutImageRef = image.cgImage?.cropping(to: cropZone) else {
            return nil
        }
        
        let performedImage = UIImage(cgImage: cutImageRef)
        return performedImage
        
    }
}

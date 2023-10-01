//
//  File.swift
//  
//
//  Created by Semih Ozsoy on 28.09.2023.
//

import UIKit

public protocol ImageSaveable: AnyObject {
    func saveImage(_ image: UIImage)
}

public extension UIViewController {
    @objc func image(_ image: UIImage,
                     didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        let title = error == nil ? "success" : "error"
        let message = error == nil ? "saved" : error?.localizedDescription
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        self.present(alert, animated: true)
    }
}

public extension ImageSaveable where Self: UIViewController {
    func saveImage(_ image: UIImage) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
    }
}

//
//  UIViewController+Extension.swift
//  
//
//  Created by Semih Ozsoy on 28.09.2023.
//

import UIKit

public extension UIViewController {
    func presentAlert(title: String = "alert", _ message: String, buttonTitle: String = "ok", buttonAction: (() -> Void)? = nil) {
        DispatchQueue.main.async { 
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert)
            let action = UIAlertAction(title: buttonTitle, style: .cancel) { _ in
                buttonAction?()
            }
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
    
    func presentAlert(title: String, message: String, okTitle: String, okAction: @escaping () -> Void, cancelTitle: String, cancelAction: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: okTitle, style: .default) { _ in
                okAction()
            }
            alert.addAction(okButton)
            
            let cancelButton = UIAlertAction(title: cancelTitle, style: .cancel) { _ in
                cancelAction?()
            }
            alert.addAction(cancelButton)
            
            self.present(alert, animated: true)
        }
    }
}

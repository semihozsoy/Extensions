//
//  UINavigationController+Extension.swift
//  
//
//  Created by Semih Ozsoy on 28.09.2023.
//

import UIKit

public enum PopToViewControllerResultType<T> {
    case fail
    case success(viewController: T)
}

public extension UINavigationController {
    func popToViewController<T: UIViewController>(
        ofClass: T.Type, animated: Bool,
        completion: ((_ result: PopToViewControllerResultType<T>) -> Void)? = nil
    ) {
        if let viewController = viewControllers.last(where: {$0.isKind(of: ofClass) }) as? T {
            popToViewController(viewController, animated: animated)
            completion?(.success(viewController: viewController))
        } else {
            completion?(.fail)
        }
    }
    
    var previousViewController: UIViewController? {
        viewControllers.count > 1 ? viewControllers[viewControllers.count - 2] : nil
    }
}



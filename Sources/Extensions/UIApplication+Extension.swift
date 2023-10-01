//
//  UIApplication+Extension.swift
//  
//
//  Created by Semih Ozsoy on 28.09.2023.
//

import UIKit

public extension UIApplication {
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationControlller = controller as? UINavigationController {
            return topViewController(controller: navigationControlller.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController as? UINavigationController {
                return topViewController(controller: selected.visibleViewController)
            }
            return topViewController(controller: tabController.selectedViewController)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    func routeToSettings(completionHandler: ((Bool) -> Void)? = nil) {
        guard let settingUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if canOpenURL(settingUrl) {
            open(settingUrl, options: [:], completionHandler: nil)
            open(settingUrl, options: [:], completionHandler: completionHandler)
        }
    }
    
    func routeToAskForSettings(title: String, message: String) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(
                title: "settings",
                style: .default,
                handler: { _ in
                    UIApplication.shared.routeToSettings()
                }))
            alert.addAction(UIAlertAction(
                title: "cancel",
                style: .cancel))
            self?.topViewController()?.present(alert, animated: true, completion: nil)
        }
    }
    
    class func getViewController<T: UIViewController>(isScene named: String? = nil, rootViewController: Bool = true) -> T {
        let controllerName = String(describing: T.self)
        let storyboardName = named ?? substringStoryboardName(withViewControllerName: controllerName)
        if rootViewController, let viewController = UIStoryboard(name: String(storyboardName), bundle: nil).instantiateInitialViewController() as? T {
            return viewController
        } else if let viewController = UIStoryboard(name: String(storyboardName), bundle: nil).instantiateViewController(withIdentifier: controllerName) as? T {
            return viewController
        } else {
            fatalError("InstantiateInitialViewController is not found")
        }
    }
    
    private class func substringStoryboardName(withViewControllerName controllerName: String) -> String {
        let viewControllerName = controllerName
        if let range = viewControllerName.range(of: "ViewController") {
            return String(viewControllerName[..<range.lowerBound])
        } else {
            return controllerName
        }
    }
}

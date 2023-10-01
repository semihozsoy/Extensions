//
//  UITableView+Extension.swift
//  
//
//  Created by Semih Ozsoy on 28.09.2023.
//

import UIKit

public extension UITableView {
    
    func registerNib(_ type: UITableViewCell.Type,
                     bundle: Bundle) {
        register(UINib(nibName: type.identifier, bundle: bundle), forCellReuseIdentifier:  type.identifier)
    }
    
    func dequeueCell<CellType: UITableViewCell>(type: CellType.Type, indexPath: IndexPath) -> CellType {
        guard let cell = dequeueReusableCell(withIdentifier: CellType.identifier, for: indexPath) as? CellType else {
            fatalError("Wrong type of cell \(type)")
        }
        return cell
    }
    
    func setLoadingAsFooter() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 100))
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.color = .black
        activityIndicator.startAnimating()
        footerView.addSubview(activityIndicator)
        activityIndicator.center = footerView.center
        tableFooterView = footerView
    }
}


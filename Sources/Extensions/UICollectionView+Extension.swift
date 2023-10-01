//
//  UICollectionView+Extension.swift
//  
//
//  Created by Semih Ozsoy on 28.09.2023.
//

import UIKit

public extension UICollectionView {
    func registerNib(_ type: UICollectionViewCell.Type, bundle: Bundle) {
        register(UINib(nibName: type.identifier, bundle: bundle), forCellWithReuseIdentifier: type.identifier)
    }
    
    func registerClass(_ type: UICollectionViewCell.Type, bundle: Bundle) {
        register(type, forCellWithReuseIdentifier: type.identifier)
    }
    
    func registerHeader(_ type: UICollectionReusableView.Type, bundle: Bundle) {
        register(UINib(nibName: type.identifier, bundle: bundle), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.identifier)
    }
    
    func dequeueHeaderView<CellType: UICollectionViewCell>(type: CellType.Type, indexPath: IndexPath) -> CellType {
        guard let cell = dequeueReusableCell(withReuseIdentifier: CellType.identifier, for: indexPath) as? CellType else {
            fatalError("Wrong type of cell \(type)")
        }
        return cell
    }
}

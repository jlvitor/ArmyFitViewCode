//
//  UITableView+Extension.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 29/09/22.
//

import UIKit

extension UITableView {
    
    func registerCell(type: UITableViewCell.Type) {
        register(type, forCellReuseIdentifier: type.identifier)
    }
    
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier) as? T
    }
    
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
    }
    
}

public extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

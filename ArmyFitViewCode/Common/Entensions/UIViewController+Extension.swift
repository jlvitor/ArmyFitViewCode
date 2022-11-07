//
//  UIViewController+Extension.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit

extension UIViewController {
    
    // MARK: - Hide keyboard
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - NavigationBar
    func setupNavigationBar(_ title: String = "", barIsHidden: Bool = false) {
        if barIsHidden {
            self.navigationController?.navigationBar.isHidden = barIsHidden
        } else {
            self.navigationController?.navigationBar.isHidden = barIsHidden
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationItem.title = title
        }
    }
}

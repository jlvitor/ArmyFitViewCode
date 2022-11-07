//
//  BaseViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 06/11/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        configBackgroundColor()
    }
    
    func configBackgroundColor() {
        self.view.backgroundColor = UIColor(named: "light")
    }
}

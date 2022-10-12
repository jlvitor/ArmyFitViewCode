//
//  LoginViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit
import SwiftUI

final class LoginViewController: UIViewController {
    
    //MARK: - Private properties
    private var loginScreen: LoginScreen?
    private let viewModel: LoginViewModel = .init()
    
    //MARK: - Init`s
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.loginScreen?.delegate(self)
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupBackground()
    }
    
    //MARK: - Private method
    private func setupBackground() {
        self.view.backgroundColor = UIColor(named: "dark")
    }
}

//MARK: - LoginScreenProtocol
extension LoginViewController: LoginScreenProtocol {
    func goToRegisterScreen() {
        let vc: RegisterViewController = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//
//  LoginViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit
import SwiftUI

class LoginViewController: BaseViewController {
    
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
        configViewModel()
        setupNavigationBar(barIsHidden: true)
    }
    
    override func configBackgroundColor() {
        self.view.backgroundColor = UIColor(named: "dark")
    }
    
    //MARK: - Private method
    private func configViewModel() {
        viewModel.delegate = self
    }
    
    private func errorAlert() {
        let error = UIAlertController(
            title: "Acesso negado",
            message: "Dados incorretos, verifique e tente novamente!",
            preferredStyle: .alert)
        let confirm = UIAlertAction(title: "OK", style: .cancel) { action in
            return
        }
        error.addAction(confirm)
        present(error, animated: true)
    }
}

//MARK: - LoginScreenProtocol
extension LoginViewController: LoginScreenProtocol {
    func goToRegisterScreen() {
        let vc: RegisterViewController = .init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func loginButtonAction() {
        viewModel.makeLoginRequest(
            loginScreen?.emailTextField.text,
            loginScreen?.passwordTextField.text)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func successAuth() {
        let tabBarVC: TabBarViewController = .init()
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.setRootViewController(tabBarVC)
    }
    
    func errorAuth() {
        errorAlert()
    }
}

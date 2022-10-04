//
//  RegisterViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - Private properties
    private var registerScreen: RegisterScreen?
    private let viewModel: RegisterViewModel = .init()
    
    //MARK: - Init`s
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupBackground()
        configNavigationBar()
        configViewModel()
        self.registerScreen?.delegate(delegate: self)
    }
    
    //MARK: - Private methods
    private func setupBackground() {
        view.backgroundColor = UIColor(named: "dark")
    }
    
    private func configNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func configViewModel() {
        viewModel.delegate = self
        viewModel.validationDelegate = self
    }
    
    private func errorAlert() {
        let error = UIAlertController(
            title: "Acesso negado",
            message: "Dados incorretos, verifique e tente novamente!",
            preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "OK", style: .cancel)
        
        error.addAction(confirm)
        present(error, animated: true)
    }
    
    private func errorPasswordValidationAlert() {
        let error = UIAlertController(
            title: "Acesso negado",
            message: "Digite a mesma senha nos dois campos",
            preferredStyle: .alert)
        
        let confirm = UIAlertAction(
            title: "Ok",
            style:.cancel)
            
        error.addAction(confirm)
        present(error, animated: true, completion: nil)
    }
}

//MARK: - RegisterScreenProtocol
extension RegisterViewController: RegisterScreenProtocol {
    func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func registerButtonAction() {
        viewModel.passwordValidation(
            registerScreen?.passwordTextField.text,
            registerScreen?.confirmPasswordTextField.text)
    }
}

//MARK: - RegisterViewModelDelegate
extension RegisterViewController: RegisterViewModelDelegate {
    func successRegister() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func errorRegister() {
        errorAlert()
    }
}

//MARK: - PasswordValidationDelegate
extension RegisterViewController: PasswordValidationDelegate {
    func successPasswordValidation() {
        guard let register = registerScreen else { return }
        
        viewModel.makeRegisterRequest(
            register.nameTextField.text,
            register.emailTextField.text,
            register.passwordTextField.text)
    }
    
    func errorPasswordValidation() {
        errorPasswordValidationAlert()
    }
}

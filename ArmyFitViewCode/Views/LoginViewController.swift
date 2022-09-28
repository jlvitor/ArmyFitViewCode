//
//  LoginViewController.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 28/09/22.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 56
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var fieldStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.placeholder = "Email"
        email.keyboardType = .emailAddress
        email.textContentType = .emailAddress
        email.autocapitalizationType = .none
        email.spellCheckingType = .no
        email.backgroundColor = .white
        email.font = UIFont.systemFont(ofSize: 17)
        email.borderStyle = .roundedRect
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Senha"
        password.isSecureTextEntry = true
        password.keyboardType = .default
        password.autocapitalizationType = .none
        password.spellCheckingType = .no
        password.backgroundColor = .white
        password.font = UIFont.systemFont(ofSize: 17)
        password.borderStyle = .roundedRect
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    private lazy var forgotPasswordStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Esqueceu a senha?"
        label.textColor = .white
        label.font = UIFont.italicSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("LOGIN", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        btn.setTitleColor(UIColor(named: "green"), for: .normal)
        btn.backgroundColor = .black
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var newAccountStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var newAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Ainda não possui conta?"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var newAccountGreenLabel: UILabel = {
        let label = UILabel()
        label.text = "Cadastre-se"
        label.textColor = UIColor(named: "green")
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor(named: "dark")
    }
}

//MARK: - ViewCode
extension LoginViewController: ViewCode {
    func buildHierarchy() {
        view.addSubview(logoImage)
        view.addSubview(fieldStackView)
        fieldStackView.addArrangedSubview(emailTextField)
        fieldStackView.addArrangedSubview(passwordTextField)
        fieldStackView.addArrangedSubview(forgotPasswordStackView)
        forgotPasswordStackView.addArrangedSubview(forgotPasswordLabel)
        view.addSubview(loginButton)
        view.addSubview(newAccountStackView)
        newAccountStackView.addArrangedSubview(newAccountLabel)
        newAccountStackView.addArrangedSubview(newAccountGreenLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 112),
            logoImage.heightAnchor.constraint(equalToConstant: 112),
            
            fieldStackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 56),
            fieldStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fieldStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            emailTextField.heightAnchor.constraint(equalToConstant: 40),

            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: fieldStackView.bottomAnchor, constant: 36),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 140),
            
            newAccountStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newAccountStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func applyAdditionalChanges() {
        setupBackground()
    }
}

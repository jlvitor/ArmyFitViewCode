//
//  RegisterScreen.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 03/10/22.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func backAction()
    func registerButtonAction()
}

final class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
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
    
    lazy var nameTextField: UITextField = {
        let email = UITextField()
        email.placeholder = "Nome"
        email.keyboardType = .alphabet
        email.autocapitalizationType = .words
        email.spellCheckingType = .no
        email.backgroundColor = .white
        email.font = UIFont.systemFont(ofSize: 17)
        email.borderStyle = .roundedRect
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    lazy var emailTextField: UITextField = {
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
    
    lazy var passwordTextField: UITextField = {
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
    
    lazy var confirmPasswordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Confirmar senha"
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
    
    private lazy var passwordInstructionsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var passwordInstructionsLabel: UILabel = {
        let label = UILabel()
        label.text = "• A senha deve conter de 8-16 caracteres"
        label.textColor = .white
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("CADASTRAR", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        btn.setTitleColor(UIColor(named: "green"), for: .normal)
        btn.backgroundColor = .black
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var hasAccountStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var hasAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Já possui conta?"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var hasAccountGreenLabel: UILabel = {
        let label = UILabel()
        label.text = "Fazer login"
        label.textColor = UIColor(named: "green")
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configGestureToNavigate() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(tappedBack(_:))
        )
        self.hasAccountStackView.addGestureRecognizer(tap)
    }
    
    @objc private func tappedBack(_ sender: UITapGestureRecognizer) {
        self.delegate?.backAction()
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.registerButtonAction()
    }
}

extension RegisterScreen: ViewCode {
    func buildHierarchy() {
        self.addSubview(logoImage)
        self.addSubview(fieldStackView)
        fieldStackView.addArrangedSubview(nameTextField)
        fieldStackView.addArrangedSubview(emailTextField)
        fieldStackView.addArrangedSubview(passwordTextField)
        fieldStackView.addArrangedSubview(confirmPasswordTextField)
        fieldStackView.addArrangedSubview(passwordInstructionsLabel)
        self.addSubview(registerButton)
        self.addSubview(hasAccountStackView)
        hasAccountStackView.addArrangedSubview(hasAccountLabel)
        hasAccountStackView.addArrangedSubview(hasAccountGreenLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 36),
            logoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 112),
            logoImage.heightAnchor.constraint(equalToConstant: 112),
            
            fieldStackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 56),
            fieldStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            fieldStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            nameTextField.heightAnchor.constraint(equalToConstant: 44),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            registerButton.topAnchor.constraint(equalTo: fieldStackView.bottomAnchor, constant: 36),
            registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 44),
            registerButton.widthAnchor.constraint(equalToConstant: 200),
            
            hasAccountStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            hasAccountStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    func applyAdditionalChanges() {
        configGestureToNavigate()
    }
}

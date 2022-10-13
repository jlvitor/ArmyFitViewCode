//
//  LoginScreen.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 03/10/22.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func goToRegisterScreen()
    func loginButtonAction()
}

final class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    func delegate(_ delegate: LoginScreenProtocol?) {
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
        let stack = UIStackView(arrangedSubviews: [
            emailTextField,
            passwordTextField,
            forgotPasswordStackView
        ])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        email.overrideUserInterfaceStyle = .light
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
        password.overrideUserInterfaceStyle = .light
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    private lazy var forgotPasswordStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [forgotPasswordLabel])
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
        btn.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var loginSocialMediaStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [googleStackView, facebookStackView])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var googleStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [googleLogo, googleLabel])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.backgroundColor = .white
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var googleLogo: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "google")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var googleLabel: UILabel = {
        let label = UILabel()
        label.text = "Continue com Google"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var facebookStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [facebookLogo, facebookLabel])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.backgroundColor = UIColor(red: 2/255, green: 155/255, blue: 229/255, alpha: 1)
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var facebookLogo: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "facebook")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var facebookLabel: UILabel = {
        let label = UILabel()
        label.text = "Continue com Facebook"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var newAccountStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [newAccountLabel, newAccountGreenLabel])
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
            action: #selector(tapAction(_:))
        )
        self.newAccountStackView.addGestureRecognizer(tap)
    }
    
    @objc private func tapAction(_ sender: UITapGestureRecognizer) {
        self.delegate?.goToRegisterScreen()
    }
    
    @objc private func tappedLoginButton() {
        self.delegate?.loginButtonAction()
    }
}

//MARK: - ViewCode
extension LoginScreen: ViewCode {
    func buildHierarchy() {
        self.addSubview(logoImage)
        self.addSubview(fieldStackView)
        self.addSubview(loginButton)
        self.addSubview(loginSocialMediaStackView)
        self.addSubview(newAccountStackView)
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
            
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            
            loginButton.topAnchor.constraint(equalTo: fieldStackView.bottomAnchor, constant: 36),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            loginButton.widthAnchor.constraint(equalToConstant: 140),
            
            loginSocialMediaStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            loginSocialMediaStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            loginSocialMediaStackView.bottomAnchor.constraint(equalTo: newAccountStackView.topAnchor, constant: -50),
            
            newAccountStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            newAccountStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    func applyAdditionalChanges() {
        configGestureToNavigate()
    }
}

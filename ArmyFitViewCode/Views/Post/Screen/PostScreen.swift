//
//  PostScreen.swift
//  ArmyFitViewCode
//
//  Created by Jean Lucas Vitor on 06/11/22.
//

import UIKit
import Kingfisher

protocol PostScreenProtocol: AnyObject {
    func makeNewPost()
}

class PostScreen: UIView {
    
    private weak var delegate: PostScreenProtocol?

    private lazy var userPostView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.circle")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 25
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Mitchel"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var publishTextView: UITextView = {
        let text = UITextView()
        text.text = "No que você está pensando?"
        text.textColor = .lightGray
        text.font = UIFont.systemFont(ofSize: 14)
        text.autocapitalizationType = .sentences
        text.backgroundColor = .clear
        text.tintColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var publishButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Publicar", for: .normal)
        btn.titleLabel?.textColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.backgroundColor = UIColor(red: 0.20, green: 0.65, blue: 0.32, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(publishButtonTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public method
    func configureDelegate(_ delegate: PostScreenProtocol?, _ textViewDelegate: UITextViewDelegate) {
        self.delegate = delegate
        publishTextView.delegate = textViewDelegate
    }
    
    func configUserLabel(_ viewModel: NewPostViewModel) {
        userImageView.kf.setImage(with: URL(string: viewModel.getUserImage))
        userNameLabel.text = viewModel.getUserName
    }
    
    func getPostDescription() -> String {
        return publishTextView.text
    }
    
    //MARK: - Private method
    @objc private func publishButtonTapped() {
        self.delegate?.makeNewPost()
    }
}

// MARK: - ViewCode
extension PostScreen: ViewCode {
    func buildHierarchy() {
        self.addSubview(userPostView)
        self.userPostView.addSubview(userImageView)
        self.userPostView.addSubview(userNameLabel)
        self.addSubview(publishTextView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userPostView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            userPostView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            userPostView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            userImageView.topAnchor.constraint(equalTo: userPostView.topAnchor, constant: 8),
            userImageView.leadingAnchor.constraint(equalTo: userPostView.leadingAnchor, constant: 12),
            userImageView.bottomAnchor.constraint(equalTo: userPostView.bottomAnchor, constant: -8),
            userImageView.heightAnchor.constraint(equalToConstant: 50),
            userImageView.widthAnchor.constraint(equalToConstant: 50),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 12),
            userNameLabel.centerYAnchor.constraint(equalTo: userPostView.centerYAnchor),
            
            publishTextView.topAnchor.constraint(equalTo: userPostView.bottomAnchor),
            publishTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            publishTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            publishTextView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
